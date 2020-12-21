import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:flutter_app/utils/database/crud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

//请注意构造appBar组件时需要知道组件高度，并重写getPreferredSize
class topHomeBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _topHomeBarState createState() => _topHomeBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _topHomeBarState extends State<topHomeBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('藏书管理器'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            scan().then((value) => {
                  Fluttertoast.showToast(
                      msg: value,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.yellow)
                });
          },
        )
      ],
    );
  }

  static insert() async {
    PersonDbProvider provider = new PersonDbProvider();
    UserModel userModel = UserModel();
    userModel.id = 1143824942687547394;
    userModel.mobile = "15801071158";
    userModel.headImage = "http://www.img";
    var i = provider.insert(userModel);
    print(i);
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

  Future<String> scan() async {
    // ignore: unrelated_type_equality_checks
    if (getCamera() != false) {
      String barcode = await scanner.scan();
      return barcode;
    } else
      return "没有获取到相机";
  }

  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  print('用户取消了操作');
                }, //关闭对话框
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  insert();
                },
              ),
            ],
          );
        });
  }
}
