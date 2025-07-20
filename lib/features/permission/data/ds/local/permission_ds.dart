import 'package:permission_handler/permission_handler.dart';

abstract class PermissionDs {
  Future<PermissionStatus> requestPermission(Permission permission);
}

class PermissionDsImpl implements PermissionDs {
  @override
  Future<PermissionStatus> requestPermission(Permission permission) {
    return permission.request();
  }
}