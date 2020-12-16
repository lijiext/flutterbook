import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_home_list.dart';

class bookHomePage extends StatefulWidget {
  @override
  _bookHomePageState createState() => _bookHomePageState();
}

class _bookHomePageState extends State<bookHomePage> {
  @override
  Widget build(BuildContext context) {
    return bookHomeList();
  }
}
