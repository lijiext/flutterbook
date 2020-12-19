import 'package:flutter/material.dart';
import 'package:flutter_app/utils/database/dbutil/database_helper.dart';

class BookSearch extends StatefulWidget {
  @override
  _BookSearchState createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: <Widget>[
            RaisedButton(
                child: Text('查询'),
                onPressed: () {
                  _query();
                }),
            RaisedButton(
                child: Text('增加'),
                onPressed: () {
                  _insert();
                }),
            RaisedButton(
                child: Text('删除'),
                onPressed: () {
                  _delete();
                }),
          ],
        ),
      ),
    );
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('图书列表:');
    allRows.forEach((row) => print(row));
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: '第一本书',
      DatabaseHelper.columnAuthor: '李杰',
      DatabaseHelper.columnPress: '科大科技出版社',
      DatabaseHelper.columnPublishDate: '2020-12',
      DatabaseHelper.columnPrice: '99.00元',
      DatabaseHelper.columnPackagingStyle: '精装',
      DatabaseHelper.columnPage: 639,
      DatabaseHelper.columnISBN: '9787506380264',
      DatabaseHelper.columnLocation: 'A301',
      DatabaseHelper.columnCount: 1,
      DatabaseHelper.columnBookImage:
          'https://img9.doubanio.com/view/subject/l/public/s28323390.jpg'
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _delete() async {
    await dbHelper.dropTable();
  }
}
