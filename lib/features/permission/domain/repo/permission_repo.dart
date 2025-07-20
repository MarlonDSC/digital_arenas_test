import 'package:permission_handler/permission_handler.dart';
import 'package:inmo_mobile/features/permission/data/ds/local/permission_ds.dart';

abstract class PermissionRepo {
  Future<PermissionStatus> requestPermission(Permission permission);
}

class PermissionRepoImpl implements PermissionRepo {
  final PermissionDs _api;

  PermissionRepoImpl(this._api);

  @override
  Future<PermissionStatus> requestPermission(Permission permission) async {
    return await _api.requestPermission(permission);
  }
}
