import 'package:dio/dio.dart';
import 'package:flutter_app/models/BookModel.dart';

BaseOptions options = new BaseOptions(receiveTimeout: 2000, sendTimeout: 1000);
Dio dio = new Dio(options);

Future<BookModel> getBookInfo(isbn) async {
  var book_info = {
    "作者": "缺省作者",
    "译者": "缺省译者",
    "出版社": "缺省出版社",
    "出版年": "缺省出版年",
    "页数": "缺省页数",
    "定价": "缺省定价",
    "装帧": "缺省装帧",
    "丛书": "缺省丛书系列",
    "location": '缺省location',
    "count": "1"
  };

  // book_info.addAll({'title': response.data['title']});
  // book_info.addAll({'作者': response.data['book_info']['作者']});
  // book_info.addAll({'出版社': response.data['book_info']['出版社']});
  // book_info.addAll({'定价': response.data['book_info']['定价']});
  // book_info.addAll({'cover_url': response.data['cover_url']});

  //下面是从api2获取的数据信息
  String url1 = "http://52.175.53.225:32768/getByIsbn?isbn=" + isbn;
  print('正在向api2发送get请求：' + url1);
  Response response1 = await dio.get(url1);
  print('api2 result: ' + response1.data.toString());
  book_info.addAll({'title': response1.data['url']['title']});
  book_info.addAll({'作者': response1.data['url']['author']});
  book_info.addAll({'出版社': response1.data['url']['publisher']});
  book_info.addAll({'定价': response1.data['url']['price']});
  book_info.addAll({'cover_url': response1.data['url']['image']});

//下面是从api1获取的信息
//   String url = "https://book.feelyou.top/isbn/" + isbn;
//   print('正在向api1发送get请求：' + url);
//   Response response = await dio.get(url);
//   print('api1 result: ' + response.data.toString());
//   book_info.addAll({'出版年': response.data['book_info']['出版年']});
//   book_info.addAll({'页数': response.data['book_info']['页数']});
//   book_info.addAll({'装帧': response.data['book_info']['装帧']});
//   book_info.addAll({'ISBN': response.data['book_info']['ISBN']});

  book_info.addAll({'出版年': '2020-12'});
  book_info.addAll({'页数': '216'});
  book_info.addAll({'装帧': '平装'});
  book_info.addAll({'ISBN': isbn});

  //下面是需要用户自己添加的信息
  book_info.addAll({"location": 'A303'});
  book_info.addAll({"count": "1"});

  var model = BookModel.fromJson(book_info);
  return model;
}
