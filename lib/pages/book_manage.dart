import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_manage_list.dart';

class BookManagePage extends StatefulWidget {
  @override
  _BookManagePageState createState() => _BookManagePageState();
}

//图书管理页面
class _BookManagePageState extends State<BookManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.dehaze),
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: '藏书管理器',
                    applicationVersion: '0.1.1',
                    applicationLegalese: '© 2020 李杰',
                    children: <Widget>[Text('一个简单的藏书管理器，点击添加图书扫码，从豆瓣获取图书信息。')]);
              }),
        ],
      ),
      body: BookManageList(),
    );
  }
}
