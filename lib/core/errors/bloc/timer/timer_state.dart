part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  String get _durationInSeconds => '${duration}s';

  String get _durationInMinutes => '${duration ~/ 60}m';

  String get _durationInMinutesAndSeconds =>
      '${duration ~/ 60}m ${duration % 60}s';

  String get _durationInHours => '${duration ~/ 3600}h';

  String get _durationInHoursAndMinutes =>
      '${duration ~/ 3600}h ${duration % 3600 ~/ 60}m';

  String get formattedDuration {
    if (duration < 60) {
      return _durationInSeconds;
    } else if (duration < 600) {
      return _durationInMinutesAndSeconds;
    } else if (duration < 3600) {
      return _durationInMinutes;
    } else if (duration < 86400) {
      return _durationInHoursAndMinutes;
    } else {
      return _durationInHours;
    }
  }

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
