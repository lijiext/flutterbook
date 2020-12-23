import 'package:dio/dio.dart';
import 'package:flutter_app/models/BookModel.dart';

BaseOptions options = new BaseOptions(receiveTimeout: 5000, sendTimeout: 3000);
Dio dio = new Dio(options);

Future<BookModel> getBookInfo(isbn) async {
  String url = "https://book.feelyou.top/isbn/" + isbn;
  print(url);
  Response response;
  response = await dio.get(url);
  if (response.statusCode != 200) print('网络请求失败');
  print(response.data);
  if (response.data['error'] != '') {
    print(response.data['error']);
  }
  var book_info = {
    "作者": "太宰治",
    "译者": "杨伟",
    "出版社": "作家出版社",
    "出版年": "2015-8",
    "页数": "219",
    "定价": "25.00元",
    "装帧": "平装",
    "丛书": "世界文学名著",
    "location": 'A303',
    "count": "1"
  };
  book_info.addAll({'title': response.data['title']});
  book_info.addAll({'作者': response.data['book_info']['作者']});
  book_info.addAll({'出版年': response.data['book_info']['出版年']});
  book_info.addAll({'出版社': response.data['book_info']['出版社']});
  book_info.addAll({'页数': response.data['book_info']['页数']});
  book_info.addAll({'定价': response.data['book_info']['定价']});
  book_info.addAll({'装帧': response.data['book_info']['装帧']});
  book_info.addAll({'ISBN': response.data['book_info']['ISBN']});
  book_info.addAll({'cover_url': response.data['cover_url']});
  book_info.addAll({"location": 'A303'});
  book_info.addAll({"count": "1"});
  var model = BookModel.fromJson(book_info);
  return model;
}
