import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:inmo_mobile/core/errors/bloc/timer/timer_bloc.dart';

void main() {
  late TimerBloc timerBloc;

  setUp(() {
    timerBloc = TimerBloc();
  });

  tearDown(() {
    timerBloc.close();
  });

  group('TimerBloc', () {
    test('initial state is TimerInitial with duration 60', () {
      expect(timerBloc.state, const TimerInitial(60));
    });

    blocTest<TimerBloc, TimerState>(
      'Given a timer is initialized '
      'When TimerStarted event is added '
      'Then the timer starts and emits TimerRunInProgress state',
      build: () => timerBloc,
      act: (bloc) => bloc.add(const TimerStarted(duration: 60)),
      expect: () => [const TimerRunInProgress(60)],
      wait: const Duration(milliseconds: 100),
    );

    blocTest<TimerBloc, TimerState>(
      'Given a timer is initialized '
      'When TimerStarted event with custom duration is added '
      'Then the timer starts with that duration',
      build: () => timerBloc,
      act: (bloc) => bloc.add(const TimerStarted(duration: 30)),
      expect: () => [const TimerRunInProgress(30)],
      wait: const Duration(milliseconds: 100),
    );

    blocTest<TimerBloc, TimerState>(
      'Given a timer is running '
      'When TimerPaused event is added '
      'Then the timer pauses and emits TimerRunPause state',
      build: () => timerBloc,
      seed: () => const TimerRunInProgress(50),
      act: (bloc) => bloc.add(const TimerPaused()),
      expect: () => [const TimerRunPause(50)],
    );

    blocTest<TimerBloc, TimerState>(
      'Given a timer is not running (in initial state) '
      'When TimerPaused event is added '
      'Then no state change occurs',
      build: () => timerBloc,
      seed: () => const TimerInitial(60),
      act: (bloc) => bloc.add(const TimerPaused()),
      expect: () => <TimerState>[],
    );

    blocTest<TimerBloc, TimerState>(
      'Given a timer is paused '
      'When TimerResumed event is added '
      'Then the timer resumes and emits TimerRunInProgress state',
      build: () => timerBloc,
      seed: () => const TimerRunPause(40),
      act: (bloc) => bloc.add(const TimerResumed()),
      expect: () => [const TimerRunInProgress(40)],
    );

    blocTest<TimerBloc, TimerState>(
      'Given a timer is not paused (in initial state) '
      'When TimerResumed event is added '
      'Then no state change occurs',
      build: () => timerBloc,
      seed: () => const TimerInitial(60),
      act: (bloc) => bloc.add(const TimerResumed()),
      expect: () => <TimerState>[],
    );

    blocTest<TimerBloc, TimerState>(
      'Given a timer is running '
      'When TimerReset event is added '
      'Then the timer resets and emits TimerInitial state',
      build: () => timerBloc,
      seed: () => const TimerRunInProgress(30),
      act: (bloc) => bloc.add(const TimerReset()),
      expect: () => [const TimerInitial(60)],
    );

    blocTest<TimerBloc, TimerState>(
      'Given a timer is paused '
      'When TimerReset event is added '
      'Then the timer resets and emits TimerInitial state',
      build: () => timerBloc,
      seed: () => const TimerRunPause(20),
      act: (bloc) => bloc.add(const TimerReset()),
      expect: () => [const TimerInitial(60)],
    );

    blocTest<TimerBloc, TimerState>(
      'Given a timer is complete '
      'When TimerReset event is added '
      'Then the timer resets and emits TimerInitial state',
      build: () => timerBloc,
      seed: () => const TimerRunComplete(),
      act: (bloc) => bloc.add(const TimerReset()),
      expect: () => [const TimerInitial(60)],
    );

    test('TimerRunComplete state has duration of 0', () {
      const state = TimerRunComplete();
      expect(state.duration, 0);
    });

    test('formattedDuration formats seconds correctly', () {
      const state = TimerRunInProgress(45);
      expect(state.formattedDuration, '45s');
    });

    test('formattedDuration formats minutes and seconds correctly', () {
      const state = TimerRunInProgress(125);
      expect(state.formattedDuration, '2m 5s');
    });

    test('formattedDuration formats minutes correctly for values >= 10 minutes', () {
      const state = TimerRunInProgress(600);
      expect(state.formattedDuration, '10m');
    });

    test('formattedDuration formats hours and minutes correctly', () {
      const state = TimerRunInProgress(3725);
      expect(state.formattedDuration, '1h 2m');
    });

    test('formattedDuration formats hours correctly for values >= 24 hours', () {
      const state = TimerRunInProgress(86400);
      expect(state.formattedDuration, '24h');
    });

    test('toString methods return expected string representations', () {
      const initialState = TimerInitial(60);
      const runningState = TimerRunInProgress(45);
      const pausedState = TimerRunPause(30);

      expect(initialState.toString(), 'TimerInitial { duration: 60 }');
      expect(runningState.toString(), 'TimerRunInProgress { duration: 45 }');
      expect(pausedState.toString(), 'TimerRunPause { duration: 30 }');
    });
  });
}