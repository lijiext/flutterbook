import 'package:flutter/material.dart';

//底部导航栏 状态管理
class BottomBarProvide with ChangeNotifier{
  int currentIndex = 0;
  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}