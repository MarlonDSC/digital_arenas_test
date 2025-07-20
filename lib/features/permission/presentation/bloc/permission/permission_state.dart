part of 'permission_bloc.dart';

sealed class PermissionState extends Equatable {
  final Map<Permission, PermissionStatus> permissions;
  final DateTime time;
  const PermissionState({required this.permissions, required this.time});

  @override
  List<Object> get props => [permissions, time];
}

final class LoadedPermissionState extends PermissionState {
  const LoadedPermissionState({
    required super.permissions,
    required super.time,
  });

  factory LoadedPermissionState.updatePermissionStatus({
    required Permission permission,
    required PermissionStatus permissionStatus,
    Map<Permission, PermissionStatus>? permissions,
  }) {
    var updatedPermissions = Map<Permission, PermissionStatus>.from(
      permissions ?? {},
    );

    updatedPermissions[permission] = permissionStatus;

    return LoadedPermissionState(
      permissions: updatedPermissions,
      time: DateTime.now(),
    );
  }
}

final class ErrorPermissionState extends PermissionState {
  final List<BaseError> errors;

  const ErrorPermissionState({
    required super.permissions,
    required super.time,
    required this.errors,
  });

  @override
  List<Object> get props => [permissions, time, errors];
}
