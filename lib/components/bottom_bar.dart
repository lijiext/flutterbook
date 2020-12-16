import 'package:flutter/material.dart';
import 'package:flutter_app/pages/book_home.dart';
import 'package:flutter_app/pages/book_manage.dart';
import 'package:flutter_app/pages/book_search.dart';

class bottomBar extends StatefulWidget {
  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  //底部导航页面
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: '图书搜索',
    ),
    BottomNavigationBarItem(
      label: '图书管理',
      icon: Icon(Icons.library_books),
    ),
  ];

  //需要的page
  final pages = [bookHomePage(), bookManagePage(), bookSearch()];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomNavItems,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.blue,
      onTap: (index) {
        _changePage(index);
      },
    );
  }

  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
