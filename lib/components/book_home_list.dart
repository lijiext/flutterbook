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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: _getBooks(),
    ));
  }

  List<Widget> _getBooks() {
    List<Widget> list = new List();
    print('_getBooks方法被调用了');
    print('_queryRows方法正在数据库中查找图书');
    var result = _queryRows();
    _queryRows().then((value) => {
          for (int i = 0; i <= value.length; i++)
            {list.add(bookHomeCard(value[i]))}
        });
    // list.add(bookHomeCard(getBookInfo(1)));
    print('即将返回list');
    return list.toList();
  }

  Future<List> _queryRows() async {
    final allRows = await dbHelper.queryAllRows();
    print('图书列表:');
    return allRows;
  }
}
