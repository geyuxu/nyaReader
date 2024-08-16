import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> getStoragePermission() async {
  late PermissionStatus myPermission;

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    myPermission = await Permission.photosAddOnly.request();
  } else {
    myPermission = await Permission.storage.request();
  }

  if (myPermission != PermissionStatus.granted) {
    return false;
  } else {
    return true;
  }
}

void checkPermission() async {
  final permissionState = await getStoragePermission();
  if (!permissionState) {
    openAppSettings();  // 引导用户打开设置页面授予权限
  }
}
