import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_home_card.dart';
// import 'package:flutter_app/models/BookModel.dart';
import 'package:flutter_app/utils/database/dbutil/database_helper.dart';
// import 'package:flutter_app/utils/network/get_book_info.dart';

class bookHomeList extends StatefulWidget {
  @override
  _bookHomeListState createState() => _bookHomeListState();
}

class _bookHomeListState extends State<bookHomeList> {
  final dbHelper = DatabaseHelper.instance;

  // bool isLoading = true;
  List<Widget> list = new List();

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: RefreshIndicator(
      //   onRefresh: _onRefresh,
      child: FutureBuilder(
        future: _getBooks(),
        builder: (BuildContext buildContext,
            AsyncSnapshot<List<Widget>> listwidget) {
          if (listwidget.hasData) {
            return ListView(
              children: listwidget.data,
            );
          } else {
            print('list 为空');
            return Text('数据为空');
          }
        },
      ),
      // ),
    );
  }

  Future<List<Widget>> _getBooks() async {
    // if (this.isLoading == true) {
    print('_getBooks方法被调用了');
    dbHelper
        .queryAllRows()
        .then((value) => {
              for (int i = 0; i < value.length; i++)
                {
                  print('获取数据$i成功：' + value.toString()),
                  list.add(bookHomeCard(value[i]))
                }
            })
        .whenComplete(() => {print('构造list已完成：' + list.toString())});
    // await Future.delayed(Duration(seconds: 3), () {
    //   print("延时三秒后请求数据");
    // });
    print('即将返回list');
    // setState(() {
    //   isLoading = false;
    // });
    return list.toList();
  }
}

// Future<Null> _onRefresh() {
//   list.clear();
//   setState(() {
//     isLoading = true;
//   });
//   _getBooks();
// }
