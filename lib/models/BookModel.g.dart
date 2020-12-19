// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return BookModel(
    bookName: json['bookName'] as String,
    bookAuthor: json['bookAuthor'] as String,
    bookTranslater: json['bookTranslater'] as String,
    bookPress: json['bookPress'] as String,
    bookPublishDate: json['bookPublishDate'] as String,
    bookPage: json['bookPage'] as String,
    bookPrice: json['bookPrice'] as String,
    bookPackagingStyle: json['bookPackagingStyle'] as String,
    bookSeiral: json['bookSeiral'] as String,
    bookISBN: json['bookISBN'] as String,
  );
}

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'bookName': instance.bookName,
      'bookAuthor': instance.bookAuthor,
      'bookTranslater': instance.bookTranslater,
      'bookPress': instance.bookPress,
      'bookPublishDate': instance.bookPublishDate,
      'bookPage': instance.bookPage,
      'bookPrice': instance.bookPrice,
      'bookPackagingStyle': instance.bookPackagingStyle,
      'bookSeiral': instance.bookSeiral,
      'bookISBN': instance.bookISBN,
    };
