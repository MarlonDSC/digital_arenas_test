import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:inmo_mobile/features/permission/domain/repo/permission_repo.dart';

class RequestPermissionUseCase {
  final PermissionRepo _repo;

  RequestPermissionUseCase(this._repo);

  Future<Result<PermissionStatus>> call(Permission permission) async {
    try {
      var response = await _repo.requestPermission(permission);
      return Right(response);
    } catch (e, s) {
      return Left([
        ErrorDetail.permission(
          'errorRequestingPermission',
          'Error requesting permission ${permission.toString()} \n ${s.toString()}',
        ),
      ]);
    }
  }
}
