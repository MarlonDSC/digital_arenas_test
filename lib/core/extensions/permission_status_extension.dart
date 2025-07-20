import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

extension PermissionStatusExtension on PermissionStatus {
  Color toColor() => switch(this) {
    PermissionStatus.denied => Colors.red,
    PermissionStatus.granted => Colors.green,
    PermissionStatus.limited => Colors.amber,
    PermissionStatus.permanentlyDenied => Colors.redAccent,
    PermissionStatus.provisional => Colors.blue,
    PermissionStatus.restricted => Colors.yellow
  };
}