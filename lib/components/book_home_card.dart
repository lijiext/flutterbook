import 'package:flutter/material.dart';

class bookHomeCard extends StatelessWidget {
  Map bookInfo;

  bookHomeCard(this.bookInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          // border: new Border.all(
                          //   //新手建议给每一个组件写一个border
                          //   color: const Color(0xff6d9eeb),
                          // ),
                          shape: BoxShape.rectangle,
                          // borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                              // fit: BoxFit.fitHeight,
                              fit: BoxFit.cover,
                              // image: AssetImage(
                              //     "assets/img/firstLineOfCode.jpg")
                              image: NetworkImage(bookInfo['bookImage']))),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: _bookDescription(
                      // bookName: bookModel.bookName,
                      bookName: bookInfo['bookName'],
                      bookAuthor: bookInfo['bookAuthor'],
                      bookId: 1001,
                      bookISBN: bookInfo['bookISBN'],
                      bookLocation: bookInfo['bookLocation'],
                      bookPress: bookInfo['bookPress'],
                      bookPrice: bookInfo['bookPrice'],
                      bookPublishDate: bookInfo['bookPublishDate'],
                      bookStatus: '已借出',
                    ),
                  ))
            ],
          )),
    );
  }
}

class _bookDescription extends StatelessWidget {
  const _bookDescription(
      {Key key,
      this.bookId,
      this.bookStatus,
      this.bookPrice,
      this.bookPress,
      this.bookAuthor,
      this.bookName,
      this.bookISBN,
      this.bookLocation,
      this.bookPublishDate})
      : super(key: key);

  final int bookId;
  final String bookName;
  final String bookAuthor;
  final String bookPress;
  final String bookPrice;
  final String bookPublishDate;
  final String bookISBN;
  final String bookLocation;
  final String bookStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
            Text(
              bookName,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              '作者：' + bookAuthor,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              '出版社：' + bookPress,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              '出版日期：' + bookPublishDate,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              '价格：' + bookPrice,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              '位置：' + bookLocation,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            )
          ],
        ));
  }
}
