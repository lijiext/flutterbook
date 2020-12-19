import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

Future<bool> getCamera() async {
  PermissionStatus cameraReady = await Permission.camera.status;
  if (cameraReady.isUndetermined || cameraReady.isDenied) {
    Fluttertoast.showToast(
        msg: "没有相机权限",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    PermissionStatus newStatus = await Permission.camera.request();
    if (newStatus.isDenied) {
      Fluttertoast.showToast(
          msg: "获取相机权限失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  } else
    return true;
}

Future scan() async {
  // ignore: unrelated_type_equality_checks
  if (getCamera() != false) {
    String barcode = await scanner.scan();
    Fluttertoast.showToast(
        msg: "扫码成功：" + barcode,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    return barcode;
  } else {
    return '没有识别到结果';
  }
}
