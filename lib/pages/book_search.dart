import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_home_card.dart';
import 'package:flutter_app/utils/crud.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SearchBar<Map>(
            placeHolder: Text('请输入图书名称'),
            onSearch: search,
            onItemFound: (Map map, int index) {
              return bookHomeCard(map);
            },
            onError: (error) {
              return Center(
                child: Text("Error occurred : $error"),
              );
            },
            emptyWidget: Center(
              child: Text('没有找到你搜索的图书哦'),
            ),
            // loader: Center(
            //   child: Text("正在搜索中，请耐心等待"),
            // ),
            minimumChars: 1,
            cancellationWidget: FlatButton(
              color: Colors.blue,
              textColor: Colors.black,
              child: Text('取消'),
            ),
            searchBarStyle: SearchBarStyle(
              // backgroundColor: Colors.lightBlue,
              padding: EdgeInsets.all(1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
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

Future<List<Map>> search(String search) async {
  List<Map> bookList = new List();
  dbHelper.queryByName(search).then((value) => {
        for (int i = 0; i < value.length; i++) {bookList.add(value[i])}
      });
  await Future.delayed(Duration(seconds: 2));
  print('search拿到的' + bookList.toString());
  // if(bookList.length == 0 )
  return bookList;
}
