import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/timer/timer_bloc.dart';
import 'package:inmo_mobile/core/ui/components/base_request_button.dart';

enum _RateLimitedButtonType { elevated, outlined, text }

class RateLimitButton extends StatelessWidget {
  final TimerBloc Function(BuildContext context) create;
  final String text;
  final bool isLoading;
  final bool isEnabled;
  final Function() onPressed;
  final _RateLimitedButtonType _type;
  final ButtonStyle? style;

  const RateLimitButton._({
    super.key,
    required this.create,
    required this.text,
    required this.isLoading,
    required this.isEnabled,
    required this.onPressed,
    required _RateLimitedButtonType type,
    this.style,
  }) : _type = type;

  const RateLimitButton.elevated({
    Key? key,
    required TimerBloc Function(BuildContext context) create,
    required String text,
    required bool isLoading,
    required bool isEnabled,
    required Function() onPressed,
    ButtonStyle? style,
  }) : this._(
         key: key,
         create: create,
         text: text,
         isLoading: isLoading,
         isEnabled: isEnabled,
         onPressed: onPressed,
         type: _RateLimitedButtonType.elevated,
         style: style,
       );

  const RateLimitButton.outlined({
    Key? key,
    required TimerBloc Function(BuildContext context) create,
    required String text,
    required bool isLoading,
    required bool isEnabled,
    required Function() onPressed,
    ButtonStyle? style,
  }) : this._(
         key: key,
         create: create,
         text: text,
         isLoading: isLoading,
         isEnabled: isEnabled,
         onPressed: onPressed,
         type: _RateLimitedButtonType.outlined,
         style: style,
       );

  const RateLimitButton.text({
    Key? key,
    required TimerBloc Function(BuildContext context) create,
    required String text,
    required bool isLoading,
    required bool isEnabled,
    required Function() onPressed,
    ButtonStyle? style,
  }) : this._(
         key: key,
         create: create,
         text: text,
         isLoading: isLoading,
         isEnabled: isEnabled,
         onPressed: onPressed,
         type: _RateLimitedButtonType.text,
         style: style,
       );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: BlocBuilder<TimerBloc, TimerState>(
        bloc: create(context),
        builder: (context, state) {
          final effectiveOnPressed =
              isLoading || state is TimerRunInProgress ? null : onPressed;
          final effectiveText =
              state is TimerRunInProgress
                  ? '$text (${state.formattedDuration})'
                  : text;

          return switch (_type) {
            _RateLimitedButtonType.elevated => BaseRequestButton.elevated(
              onPressed: effectiveOnPressed,
              isLoading: isLoading,
              isEnabled:
                  isEnabled && !(isLoading || state is TimerRunInProgress),
              style: style,
              child: Text(effectiveText),
            ),
            _RateLimitedButtonType.outlined => BaseRequestButton.outlined(
              onPressed: effectiveOnPressed,
              isLoading: isLoading,
              isEnabled:
                  isEnabled && !(isLoading || state is TimerRunInProgress),
              style: style,
              child: Text(effectiveText),
            ),
            _RateLimitedButtonType.text => BaseRequestButton.text(
              onPressed: effectiveOnPressed,
              isLoading: isLoading,
              isEnabled:
                  isEnabled && !(isLoading || state is TimerRunInProgress),
              style: style,
              child: Text(effectiveText),
            ),
          };
        },
      ),
    );
  }
}
