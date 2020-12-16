import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';


//请注意构造appBar组件时需要知道组件高度，并重写getPreferredSize
class topHomeBar extends StatefulWidget with PreferredSizeWidget{
  @override
  _topHomeBarState createState() => _topHomeBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _topHomeBarState extends State<topHomeBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('图书管理器'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            scan();
          },
        )
      ],
    );
  }

  Future<bool> getCamera() async {
    PermissionStatus cameraReady = await Permission.camera.status;
    if (cameraReady.isUndetermined || cameraReady.isDenied) {
      print('没有获取到相机权限');
      PermissionStatus newStatus = await Permission.camera.request();
      if (newStatus.isDenied) {
        print("再次获取相机权限失败");
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
      print(barcode);
    }
  }
}
