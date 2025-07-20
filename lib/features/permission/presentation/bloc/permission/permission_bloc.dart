import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:inmo_mobile/features/permission/domain/usecases/request_permission.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  final RequestPermissionUseCase _requestPermissionUseCase;

  PermissionBloc(this._requestPermissionUseCase)
    : super(
        LoadedPermissionState(permissions: const {}, time: DateTime.now()),
      ) {
    on<RequestPermission>(_onRequestPermission);
  }

  Future<void> _onRequestPermission(
    RequestPermission event,
    Emitter<PermissionState> emit,
  ) async {
    var result = await _requestPermissionUseCase(event.permission);
    result.fold(
      (l) => emit(
        ErrorPermissionState(
          permissions: state.permissions,
          time: state.time,
          errors: l,
        ),
      ),
      (r) => emit(
        LoadedPermissionState.updatePermissionStatus(
          permission: event.permission,
          permissionStatus: r,
          permissions: state.permissions,
        ),
      ),
    );
  }
}
