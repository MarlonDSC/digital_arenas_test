import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'modal_event.dart';
part 'modal_state.dart';

class ModalBloc extends Bloc<ModalEvent, ModalState> {
  ModalBloc() : super(ModalInitial()) {
    on<DisplayModal>(_displayModal);
  }

  void _displayModal(DisplayModal event, Emitter<ModalState> emit) {
    emit(DisplayModalState(event.modal, time: DateTime.now()));
  }
}
