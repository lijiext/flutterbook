import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_app/pages/book_home.dart';
import 'package:flutter_app/pages/book_manage.dart';
import 'package:flutter_app/pages/book_search.dart';
import 'package:flutter_app/provide/bottom_bar_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabsItem = [
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
  final List<Widget> bottomTabs = [
    BookHomePage(),
    BookSearch(),
    BookManagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Provide<BottomBarProvide>(
      builder: (context, child, val) {
        //查找Provide中的BottomBarProvide，获取currentIndex
        int currentIndex =
            Provide.value<BottomBarProvide>(context).currentIndex;
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            //使用了index，当provider调用
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.blue,
            items: bottomTabsItem,
            onTap: (index) {
              Provide.value<BottomBarProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: bottomTabs,
          ),
        );
      },
    );
  }
}
