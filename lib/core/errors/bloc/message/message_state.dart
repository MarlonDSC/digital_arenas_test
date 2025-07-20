part of 'message_bloc.dart';

sealed class MessageState extends Equatable {
  final List<String> messages;
  final DateTime time;
  final Color? color;
  final MapEntry<String, void Function()>? action;
  final PriorityType priority;
  const MessageState(
    this.messages, {
    required this.time,
    this.color,
    this.action,
    this.priority = PriorityType.low,
  });

  @override
  List<Object?> get props => [messages, time, color, action, priority];
}

final class DisplayedMessageState extends MessageState {
  const DisplayedMessageState(
    super.messages, {
    required super.time,
    super.color,
    super.action,
    required super.priority,
  });

  List<List<String>> get messageChunks {
    final chunks = <List<String>>[];
    for (var i = 0; i < messages.length; i += 2) {
      final end = i + 2;
      chunks.add(
        messages.sublist(i, end > messages.length ? messages.length : end),
      );
    }
    return chunks;
  }

  @override
  List<Object?> get props => [...super.props, priority];
}
