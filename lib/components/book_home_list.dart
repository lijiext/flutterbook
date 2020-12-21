import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_home_card.dart';
import 'package:flutter_app/utils/database/dbutil/database_helper.dart';

class bookHomeList extends StatefulWidget {
  @override
  _bookHomeListState createState() => _bookHomeListState();
}

class _bookHomeListState extends State<bookHomeList> {
  final dbHelper = DatabaseHelper.instance;
  List bookList = new List();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new RefreshIndicator(
          child: new ListView.builder(
            itemBuilder: (context, index) {
              return new Container(
                alignment: Alignment.topLeft,
                key: new PageStorageKey<int>(index),
                child: new bookHomeCard(bookList[index]),
              );
            },
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: bookList.length,
          ),
          onRefresh: () => _handlerRefresh()),
    );
  }

  Future<Null> _handlerRefresh() async {
    bookList.clear();
    await dbHelper
        .queryAllRows()
        .then((value) => {
              for (int i = 0; i < value.length; i++) {bookList.add(value[i])}
            })
        .whenComplete(() => {print('构造list已完成：' + bookList.toString())});
    setState(() {
      bookList = bookList.toList();
      print(bookList);
    });
    return null;
  }
}
