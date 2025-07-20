import 'package:flutter/material.dart';

enum _BaseRequestButtonType { elevated, outlined, text }

class BaseRequestButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final _BaseRequestButtonType _type;
  final ButtonStyle? style;
  final VoidCallback? onLongPress;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip? clipBehavior;

  const BaseRequestButton._({
    super.key,
    required this.child,
    required this.onPressed,
    required this.isLoading,
    required this.isEnabled,
    required _BaseRequestButtonType type,
    this.style,
    this.onLongPress,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
  }) : _type = type;

  const BaseRequestButton.elevated({
    Key? key,
    required Widget child,
    required void Function()? onPressed,
    required bool isLoading,
    required bool isEnabled,
    ButtonStyle? style,
    VoidCallback? onLongPress,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip? clipBehavior,
  }) : this._(
         key: key,
         child: child,
         onPressed: onPressed,
         isLoading: isLoading,
         isEnabled: isEnabled,
         type: _BaseRequestButtonType.elevated,
         style: style,
         onLongPress: onLongPress,
         focusNode: focusNode,
         autofocus: autofocus,
         clipBehavior: clipBehavior,
       );

  const BaseRequestButton.outlined({
    Key? key,
    required Widget child,
    required void Function()? onPressed,
    required bool isLoading,
    required bool isEnabled,
    ButtonStyle? style,
    VoidCallback? onLongPress,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip? clipBehavior,
  }) : this._(
         key: key,
         child: child,
         onPressed: onPressed,
         isLoading: isLoading,
         isEnabled: isEnabled,
         type: _BaseRequestButtonType.outlined,
         style: style,
         onLongPress: onLongPress,
         focusNode: focusNode,
         autofocus: autofocus,
         clipBehavior: clipBehavior,
       );

  const BaseRequestButton.text({
    Key? key,
    required Widget child,
    required void Function()? onPressed,
    required bool isLoading,
    required bool isEnabled,
    ButtonStyle? style,
    VoidCallback? onLongPress,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip? clipBehavior,
  }) : this._(
         key: key,
         child: child,
         onPressed: onPressed,
         isLoading: isLoading,
         isEnabled: isEnabled,
         type: _BaseRequestButtonType.text,
         style: style,
         onLongPress: onLongPress,
         focusNode: focusNode,
         autofocus: autofocus,
         clipBehavior: clipBehavior,
       );

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = isLoading || !isEnabled ? null : onPressed;
    final effectiveChild =
        isLoading ? const CircularProgressIndicator() : child;

    return switch (_type) {
      _BaseRequestButtonType.elevated => ElevatedButton(
        onPressed: effectiveOnPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: effectiveChild,
      ),
      _BaseRequestButtonType.outlined => OutlinedButton(
        onPressed: effectiveOnPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: effectiveChild,
      ),
      _BaseRequestButtonType.text => TextButton(
        onPressed: effectiveOnPressed,
        onLongPress: onLongPress,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: effectiveChild,
      ),
    };
  }
}

class BaseRequestElevatedButton extends BaseRequestButton {
  const BaseRequestElevatedButton({
    super.key,
    required super.child,
    required super.onPressed,
    required super.isLoading,
    required super.isEnabled,
    super.style,
    super.onLongPress,
    super.focusNode,
    super.autofocus,
    super.clipBehavior,
  }) : super.elevated();
}

class BaseRequestOutlinedButton extends BaseRequestButton {
  const BaseRequestOutlinedButton({
    super.key,
    required super.child,
    required super.onPressed,
    required super.isLoading,
    required super.isEnabled,
    super.style,
    super.onLongPress,
    super.focusNode,
    super.autofocus,
    super.clipBehavior,
  }) : super.outlined();
}

class BaseRequestTextButton extends BaseRequestButton {
  const BaseRequestTextButton({
    super.key,
    required super.child,
    required super.onPressed,
    required super.isLoading,
    required super.isEnabled,
    super.style,
    super.onLongPress,
    super.focusNode,
    super.autofocus,
    super.clipBehavior,
  }) : super.text();
}
