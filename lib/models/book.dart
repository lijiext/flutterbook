class book {
  book(
      {this.bookName,
      this.bookAuthor,
      this.bookId,
      this.bookPress,
      this.bookPrice,
      this.bookPosition,
      this.bookStatus,
      this.bookPublishDate,
      this.bookISBN});

  int bookId;
  String bookName;
  String bookAuthor;
  String bookPress;
  int bookPrice;
  String bookPublishDate;
  String bookISBN;
  String bookPosition;
  bool bookStatus;

  @override
  String toString() {
    return 'BookModel{bookId: $bookId, bookName: $bookName, bookAuthor: $bookAuthor, bookPress: $bookPress, bookPrice: $bookPrice, bookPublishDate: $bookPublishDate, bookISBN: $bookISBN, bookPosition: $bookPosition, bookStatus: $bookStatus}';
  }
}
