part of 'permission_bloc.dart';

sealed class PermissionEvent extends Equatable {
  const PermissionEvent();

  @override
  List<Object> get props => [];
}

final class RequestPermission extends PermissionEvent {
  final Permission permission;
  const RequestPermission(this.permission);

  @override
  List<Object> get props => [permission];
}
