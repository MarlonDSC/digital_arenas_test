part of 'modal_bloc.dart';

sealed class ModalState extends Equatable {
  const ModalState();

  @override
  List<Object> get props => [];
}

final class ModalInitial extends ModalState {}

final class DisplayModalState extends ModalState {
  final Widget modal;
  final DateTime time;
  const DisplayModalState(this.modal, {required this.time});

  @override
  List<Object> get props => [modal, time];
}
