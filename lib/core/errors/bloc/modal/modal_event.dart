part of 'modal_bloc.dart';

sealed class ModalEvent extends Equatable {
  const ModalEvent();

  @override
  List<Object> get props => [];
}

final class DisplayModal extends ModalEvent {
  final Widget modal;
  const DisplayModal(this.modal);
}
