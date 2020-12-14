// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '你好Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('欢迎使用Flutter'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}