import 'package:json_annotation/json_annotation.dart';

part 'BookModel.g.dart';

@JsonSerializable()
class BookModel extends Object {
  BookModel({
    this.bookName,
    this.bookAuthor,
    this.bookTranslater,
    this.bookPress,
    this.bookPublishDate,
    this.bookPage,
    this.bookPrice,
    this.bookPackagingStyle,
    this.bookSeiral,
    this.bookISBN,
  });

  String bookName;
  String bookAuthor;
  String bookTranslater;
  String bookPress;
  String bookPublishDate;
  String bookPage;
  String bookPrice;
  String bookPackagingStyle;
  String bookSeiral;
  String bookISBN;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        bookAuthor: json["作者"],
        bookName: json["title"],
        bookTranslater: json["译者"],
        bookPress: json["出版社"],
        bookPublishDate: json["出版年"],
        bookPage: json["页数"],
        bookPrice: json["定价"],
        bookPackagingStyle: json["装帧"],
        bookSeiral: json["丛书"],
        bookISBN: json["ISBN"],
      );

  Map<String, dynamic> toJson() => {
        "title": bookName,
        "作者": bookAuthor,
        "译者": bookTranslater,
        "出版社": bookPress,
        "出版年": bookPublishDate,
        "页数": bookPage,
        "定价": bookPrice,
        "装帧": bookPackagingStyle,
        "丛书": bookSeiral,
        "ISBN": bookISBN,
      };

  @override
  String toString() {
    return 'BookModel{bookName: $bookName, bookAuthor: $bookAuthor, bookTranslater: $bookTranslater, bookPress: $bookPress, bookPublishDate: $bookPublishDate, bookPage: $bookPage, bookPrice: $bookPrice, bookPackagingStyle: $bookPackagingStyle, bookSeiral: $bookSeiral, bookISBN: $bookISBN}';
  }
}
