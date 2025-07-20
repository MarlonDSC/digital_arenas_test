part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  final List<String> messages;
  final Color? color;
  final MapEntry<String, void Function()>? action;
  final PriorityType priority;
  const MessageEvent(
    this.messages, {
    this.color,
    this.action,
    required this.priority,
  });

  @override
  List<Object?> get props => [messages, color, action];
}

final class DisplayMessage extends MessageEvent {
  // const DisplayError._(super.message, {super.color, super.action});

  const DisplayMessage(
    super.messages, {
    super.color,
    super.action,
    required super.priority,
  });

  const DisplayMessage.lowPriority(super.messages, {super.color, super.action})
    : super(priority: PriorityType.low);

  const DisplayMessage.mediumPriority(
    super.messages, {
    super.color,
    super.action,
  }) : super(priority: PriorityType.medium);

  const DisplayMessage.highPriority(super.messages, {super.color, super.action})
    : super(priority: PriorityType.high);
}
