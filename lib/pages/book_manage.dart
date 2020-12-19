import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_manage_list.dart';

class BookManagePage extends StatefulWidget {
  @override
  _BookManagePageState createState() => _BookManagePageState();
}

class _BookManagePageState extends State<BookManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.dehaze), onPressed: () {}),
        ],
      ),
      body: BookManageList(),
    );
  }
}
