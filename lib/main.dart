// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_home_card.dart';
import 'package:flutter_app/components/book_home_list.dart';
import 'package:flutter_app/components/myAppBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// home: myAppBar(),
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('图书管理器'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: bookHomeList(),
    ));
  }
}
