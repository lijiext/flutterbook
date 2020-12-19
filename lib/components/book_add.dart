import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/data.dart';
import 'package:flutter_app/utils/camera/scanner.dart';
import 'package:flutter_app/utils/network/get_book_info.dart';

class BookAdd extends StatefulWidget {
  @override
  _BookAddState createState() => _BookAddState();
}

class _BookAddState extends State<BookAdd> {
  String result = '没有结果';
  var bookModel = BookModel();
  TextEditingController _bookNameController = new TextEditingController();
  TextEditingController _bookAuthorController = new TextEditingController();
  TextEditingController _bookPressController = new TextEditingController();
  TextEditingController _bookPublishDateController =
      new TextEditingController();
  TextEditingController _bookPriceController = new TextEditingController();
  TextEditingController _bookPositionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('添加图书'),
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                scan().then((res) => {
                      print('图书条码：' + res),
                      getBookInfo(res).then((value) => {
                            print('获取图书信息：' + value.bookName),
                            setState(() {
                              result = value.bookISBN;
                              _bookNameController.text = value.bookName;
                              _bookAuthorController.text = value.bookAuthor;
                              _bookPressController.text = value.bookPress;
                              _bookPublishDateController.text =
                                  value.bookPublishDate;
                              _bookPriceController.text = value.bookPrice;
                            })
                          })
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
                        controller: _bookPublishDateController,
                        inputFormatters: [LengthLimitingTextInputFormatter(32)],
                        decoration: InputDecoration(
                          labelText: '出版日期：',
                          hintText: '请输入图书出版日期',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                    title: Text('选择日期'),
                                    content: new Text("Hey! I'm Coflutter!"),
                                    actions: <Widget>[
                                      RaisedButton(
                                        child: Text('Close me!'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ));
                        }),
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
                          // Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "扫描结果：" + result,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // 显示不完，就在后面显示点点
                style: TextStyle(
                  fontSize: 20, // 文字大小文字颜色
                ),
              )
            ],
          ),
        ));
  }
}
