import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inmo_mobile/core/value_objects/priority_type.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc()
    : super(
        DisplayedMessageState(
          [],
          time: DateTime.now(),
          priority: PriorityType.low,
        ),
      ) {
    on<DisplayMessage>(_displayError);
  }

  Future<void> _displayError(
    DisplayMessage event,
    Emitter<MessageState> emit,
  ) async {
    emit(
      DisplayedMessageState(
        event.messages,
        time: DateTime.now(),
        color: event.color,
        action: event.action,
        priority: event.priority,
      ),
    );
  }
}
