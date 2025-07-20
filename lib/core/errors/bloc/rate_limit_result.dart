import 'package:equatable/equatable.dart';

class RateLimitResult extends Equatable {
  final bool isAllowed;
  final int remainingSeconds;
  final int attempts;
  final int limitSeconds;

  const RateLimitResult._({
    required this.isAllowed,
    this.remainingSeconds = 0,
    this.attempts = 0,
    this.limitSeconds = 0,
  });

  int get successfulAttempts => attempts;

  DateTime get lastAttemptTime =>
      DateTime.now().subtract(Duration(seconds: remainingSeconds));

  factory RateLimitResult.allow([int attempts = 0]) =>
      RateLimitResult._(isAllowed: true, attempts: attempts);

  factory RateLimitResult.limited({
    required int remainingSeconds,
    required int attempts,
    required int limitSeconds,
  }) => RateLimitResult._(
    isAllowed: false,
    remainingSeconds: remainingSeconds,
    attempts: attempts,
    limitSeconds: limitSeconds,
  );

  @override
  List<Object?> get props => [
    isAllowed,
    remainingSeconds,
    attempts,
    limitSeconds,
  ];
}
