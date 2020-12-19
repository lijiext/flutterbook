import 'package:flutter_app/models/BookModel.dart';

BookModel getBookInfo(isbn) {
  var book_info = {
    "作者": "太宰治",
    "译者": "杨伟",
    "出版社": "作家出版社",
    "出版年": "2015-8",
    "页数": "219",
    "定价": "25.00元",
    "装帧": "平装",
    "丛书": "世界文学名著",
    "ISBN": "9787506380263",
    "title": '人间失格',
    "location": 'A303',
    "cover_url":
        'https://img9.doubanio.com/view/subject/l/public/s28323390.jpg',
    "count": "3"
  };
  book_info.addAll({"title": '人间失格'});
  book_info.addAll({"location": 'A303'});
  book_info.addAll({
    "cover_url": 'https://img9.doubanio.com/view/subject/l/public/s28323390.jpg'
  });
  book_info.addAll({"count": "3"});
  var model = BookModel.fromJson(book_info);
  return model;
}
