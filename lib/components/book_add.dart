import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/BookModel.dart';
import 'package:flutter_app/utils/camera/scanner.dart';
import 'package:flutter_app/utils/crud.dart';
import 'package:flutter_app/utils/network/get_book_info.dart';
import 'package:flutter_app/utils/toast/mytoast.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class BookAdd extends StatefulWidget {
  @override
  _BookAddState createState() => _BookAddState();
}

class _BookAddState extends State<BookAdd> {
  String result = '没有结果';
  BookModel bookModel;

  // final dbHelper = DatabaseHelper.instance;
  TextEditingController _bookNameController = new TextEditingController();
  TextEditingController _bookAuthorController = new TextEditingController();
  TextEditingController _bookPressController = new TextEditingController();
  TextEditingController _bookPriceController = new TextEditingController();
  TextEditingController _bookPositionController = new TextEditingController();
  String selectedDate = '';

  @override
  initState() {
    super.initState();
    selectedDate = DateFormat('yyyy-MM').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('添加图书'),
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                scan().then((res) => {
                      print('图书条码：' + res),
                      //扫码之后得到图书ISBN，填入controller中，用户点击添加之后才往数据库中添加数据
                      getBookInfo(res).then((value) => {
                            bookModel = value,
                            print(bookModel),
                            _bookNameController.text = bookModel.bookName,
                            _bookAuthorController.text = bookModel.bookAuthor,
                            _bookPressController.text = bookModel.bookPress,
                            _bookPriceController.text = bookModel.bookPrice,
                            selectedDate = bookModel.bookPublishDate,
                            _bookPositionController.text =
                                bookModel.bookLocation
                          }),
                      // bookModel = getBookInfo(res),
                    });
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView(
            children: [
              Card(
                  child: Column(
                children: [
                  TextField(
                    controller: _bookNameController,
                    inputFormatters: [LengthLimitingTextInputFormatter(32)],
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      labelText: '书名：',
                      hintText: '请输入图书名称',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
              Card(
                  child: Column(
                children: [
                  TextField(
                    controller: _bookAuthorController,
                    inputFormatters: [LengthLimitingTextInputFormatter(32)],
                    decoration: InputDecoration(
                      labelText: '作者：',
                      hintText: '请输入图书作者',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
              Card(
                child: Column(
                  children: [
                    TextField(
                      controller: _bookPressController,
                      inputFormatters: [LengthLimitingTextInputFormatter(32)],
                      decoration: InputDecoration(
                        labelText: '出版社：',
                        hintText: '请输入图书出版社',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    TextField(
                      controller: _bookPriceController,
                      inputFormatters: [LengthLimitingTextInputFormatter(32)],
                      decoration: InputDecoration(
                        labelText: '价格：',
                        hintText: '请输入图书价格',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    TextField(
                      controller: _bookPositionController,
                      inputFormatters: [LengthLimitingTextInputFormatter(32)],
                      decoration: InputDecoration(
                        labelText: '位置：',
                        hintText: '请输入图书位置',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                //日期选择按钮
                child: Column(
                  children: [
                    FlatButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1900, 1, 1),
                              maxTime: DateTime(2099, 12, 12),
                              onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                            setState(() {
                              print(DateFormat('yyyy-MM').format(date));
                              selectedDate = DateFormat('yyyy-MM').format(date);
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.zh);
                        },
                        child: Text(
                          '请选择出版日期：$selectedDate ',
                        ))
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.blue,
                        child: Text(
                          '添加',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          print(_bookNameController.text);
                          if (_bookNameController.text.length == 0) {
                            Toast.show("请填写图书信息");
                          } else {
                            insertBook(bookModel);
                          }

                          // _insert(bookModel);
                          // Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
