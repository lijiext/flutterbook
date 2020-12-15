import 'package:flutter/material.dart';

class myAppBar extends StatefulWidget {
  @override
  _myAppBarState createState() => _myAppBarState();
}

class _myAppBarState extends State<myAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图书管理器'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu),onPressed: (){},),
          IconButton(icon: Icon(Icons.add),onPressed: (){},)
        ],
      ),
    );
  }
}
