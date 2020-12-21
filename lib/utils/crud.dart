import 'package:flutter/material.dart';
import 'package:flutter_app/models/BookModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'database/dbutil/database_helper.dart';

final dbHelper = DatabaseHelper.instance;

void insertBook(BookModel bookmodel) async {
  Map<String, dynamic> row = {
    DatabaseHelper.columnName: bookmodel.bookName,
    DatabaseHelper.columnAuthor: bookmodel.bookAuthor,
    DatabaseHelper.columnPress: bookmodel.bookPress,
    DatabaseHelper.columnPublishDate: bookmodel.bookPublishDate,
    DatabaseHelper.columnPrice: bookmodel.bookPrice,
    DatabaseHelper.columnPackagingStyle: bookmodel.bookPackagingStyle,
    DatabaseHelper.columnPage: bookmodel.bookPage,
    DatabaseHelper.columnISBN: bookmodel.bookISBN,
    DatabaseHelper.columnLocation: bookmodel.bookLocation,
    DatabaseHelper.columnCount: bookmodel.bookCount,
    DatabaseHelper.columnBookImage: bookmodel.bookImage
  };
  final id = await dbHelper.insert(row);
  Fluttertoast.showToast(
      msg: "图书添加成功" + id.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
