import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/UserModel.dart';
import 'package:flutter_app/utils/database/crud.dart';
import 'package:sqflite/sqflite.dart';

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('增删改查'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            OutlineButton(child: Text('创建数据库和一张表'), onPressed: insert),
            OutlineButton(child: Text('查询数据'), onPressed: get),
            OutlineButton(child: Text('插入数据'), onPressed: insert),
            OutlineButton(child: Text('更新数据'), onPressed: insert),
            OutlineButton(child: Text('删除数据'), onPressed: insert),
            OutlineButton(child: Text('关闭数据库'), onPressed: insert),
            OutlineButton(child: Text('删除数据库'), onPressed: insert),
            OutlineButton(child: Text('改变文本'), onPressed: clickToChangeText),
            Text(mobile),
            Text(textTochange)
          ],
        ),
      ),
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

  static update() async {
    PersonDbProvider provider = new PersonDbProvider();
    UserModel userModel = await provider.getPersonInfo(1143824942687547394);
    userModel.mobile = "15801071157";
    userModel.headImage = "http://www.img1";
    provider.update(userModel);
  }
  var mobile = '空字符串';
  get() async {
    var databasesPath = await getDatabasesPath();
    setState(() {
      PersonDbProvider provider = new PersonDbProvider();
      Future<UserModel> userModel = provider.getPersonInfo(1143824942687547394);
      userModel.then((res) => {mobile = res.toJson()['mobile']});
      print('数据库的存储路径是：' + databasesPath);
    });
  }
  var textTochange = "需要改变的文本";
  int i = 0;
  clickToChangeText() {
    setState(() {
      textTochange = "我已经改变了" + i.toString() + "次";
      i++;
    });
  }
}
