// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/components/bottom_bar.dart';
import 'package:flutter_app/components/top_home_bar.dart';
import 'package:flutter_app/pages/book_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// home: myAppBar(),
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: topHomeBar(),
            body: bookHomePage(),
            bottomNavigationBar: bottomBar()));
  }
}
