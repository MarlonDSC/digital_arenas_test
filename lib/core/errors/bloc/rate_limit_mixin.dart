import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:inmo_mobile/core/errors/bloc/rate_limit_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A mixin that provides rate limiting functionality to BLoCs
mixin RateLimit<Event, State> on BlocBase<State> {
  /// Override to define rate limits for specific events
  Map<Type, RateLimitConfig> get rateLimitConfigs => {};
  Map<Type, int> get rateLimitResetTimes => {};

  static SharedPreferences? _sharedPrefs;
  static SharedPreferences get _prefs {
    if (_sharedPrefs == null) {
      throw StateError(
        'RateLimit.initializeRateLimiter() must be called before using rate limiting',
      );
    }
    return _sharedPrefs!;
  }

  final String _rateLimitStoragePrefix = 'rate_limit_';

  /// Initialize the mixin
  static Future<void> initializeRateLimiter() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  /// Check if the rate limiter has been initialized
  static bool get isInitialized => _sharedPrefs != null;

  /// Initialize the rate limiter only if not already initialized
  static Future<void> ensureInitialized() async {
    if (!isInitialized) {
      await initializeRateLimiter();
    }
  }

  /// Checks if an event is allowed based on rate limiting rules
  Future<RateLimitResult> checkRateLimit(Event event) async {
    final eventType = event.runtimeType;
    final config = rateLimitConfigs[eventType];

    // If no config exists for this event, allow it
    if (config == null) {
      return RateLimitResult.allow();
    }

    final storageKey =
        '$_rateLimitStoragePrefix${eventType}_${_getBlocIdentifier()}';
    final attempts = _prefs.getInt('${storageKey}_attempts') ?? 0;
    final lastAttemptMillis = _prefs.getInt('${storageKey}_lastAttempt');
    final lastAttempt =
        lastAttemptMillis != null
            ? DateTime.fromMillisecondsSinceEpoch(lastAttemptMillis)
            : null;

    // Get the applicable rate limit
    final limit = config.getLimit(attempts);

    if (lastAttempt != null) {
      final elapsed = DateTime.now().difference(lastAttempt).inSeconds;

      if (elapsed < limit) {
        return RateLimitResult.limited(
          remainingSeconds: limit - elapsed,
          attempts: attempts,
          limitSeconds: limit,
        );
      }

      // Reset rate limit if last attempt was more than the reset time
      if (elapsed > (rateLimitResetTimes[eventType] ?? 900)) {
        await _prefs.setInt('${storageKey}_attempts', 0);
        await _prefs.setInt(
          '${storageKey}_lastAttempt',
          DateTime.now().millisecondsSinceEpoch,
        );
        return RateLimitResult.allow(0);
      }
    }

    // Update attempt count
    await _prefs.setInt('${storageKey}_attempts', attempts + 1);
    await _prefs.setInt(
      '${storageKey}_lastAttempt',
      DateTime.now().millisecondsSinceEpoch,
    );

    return RateLimitResult.allow(attempts + 1);
  }

  Future<void> resetRateLimitForEvent(Event event) async {
    await ensureInitialized();
    final eventType = event.runtimeType;
    final storageKey =
        '$_rateLimitStoragePrefix${eventType}_${_getBlocIdentifier()}';
    await _prefs.remove('${storageKey}_attempts');
    await _prefs.remove('${storageKey}_lastAttempt');
  }

  /// Only use this for testing purposes
  @visibleForTesting
  static Future<void> resetAllRateLimits() async {
    await ensureInitialized();
    await _prefs.clear();
  }

  /// Gets remaining time for an event
  Future<int> getRemainingTime(Event event) async {
    final eventType = event.runtimeType;
    final config = rateLimitConfigs[eventType];
    if (config == null) return 0;

    final storageKey =
        '$_rateLimitStoragePrefix${eventType}_${_getBlocIdentifier()}';
    final attempts = _prefs.getInt(storageKey) ?? 0;
    final lastAttemptMillis = _prefs.getInt('${storageKey}_lastAttempt');
    if (lastAttemptMillis == null) return 0;

    final limit = config.getLimit(attempts);
    final lastAttempt = DateTime.fromMillisecondsSinceEpoch(lastAttemptMillis);
    final elapsed = DateTime.now().difference(lastAttempt).inSeconds;
    return (limit - elapsed).clamp(0, limit);
  }

  /// Resets rate limiting for a specific event
  Future<void> resetRateLimit(Event event) async {
    final eventType = event.runtimeType;
    final storageKey =
        '$_rateLimitStoragePrefix${eventType}_${_getBlocIdentifier()}';
    await _prefs.remove('${storageKey}_attempts');
    await _prefs.remove('${storageKey}_lastAttempt');
  }

  /// Generates a unique identifier for the BLoC
  String _getBlocIdentifier() {
    return runtimeType.toString();
  }

  /// Generic rate limit handler that encapsulates the common rate limit logic
  ///
  /// [event] - The event to check rate limiting for
  /// [emit] - The emit function to emit states
  /// [loadingState] - The loading state to emit before checking rate limit
  /// [rateLimitedFailureState] - The failure state to emit if rate limited
  /// [onAllowed] - Callback to execute if rate limit allows the action
  Future<void> handleWithRateLimit({
    required Event event,
    required Emitter<State> emit,
    required State loadingState,
    required Function(RateLimitResult) rateLimitedFailureState,
    required Future<void> Function() onAllowed,
  }) async {
    emit(loadingState);
    await onAllowed();
    final rateLimitResult = await checkRateLimit(event);
    if (!rateLimitResult.isAllowed) {
      emit(rateLimitedFailureState(rateLimitResult));
    }
  }
}

/// Rate limit configuration for a specific event type
class RateLimitConfig {
  final Map<int, int> attemptLimits; // {minAttempt: secondsToWait}

  const RateLimitConfig(this.attemptLimits);

  /// Default progressive rate limiting configuration
  factory RateLimitConfig.progressive() {
    return const RateLimitConfig({
      1: 0, // First attempt: no delay
      4: 300, // Fourth attempt: 5m delay
    });
  }

  /// Gets the applicable limit for a given attempt count
  int getLimit(int attempts) {
    // Sort thresholds in descending order to find the highest applicable limit
    final thresholds =
        attemptLimits.keys.toList()..sort((a, b) => b.compareTo(a));

    for (final threshold in thresholds) {
      if (attempts >= threshold) {
        return attemptLimits[threshold]!;
      }
    }

    return 0; // Default to no limit if no threshold matches
  }
}
