import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_home_list.dart';
import 'package:flutter_app/components/top_home_bar.dart';

class BookHomePage extends StatefulWidget {
  @override
  _BookHomePageState createState() => _BookHomePageState();
}

class _BookHomePageState extends State<BookHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topHomeBar(),
      body: bookHomeList(),
    );
  }
}
