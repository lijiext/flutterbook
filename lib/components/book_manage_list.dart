import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_add.dart';

class BookManageList extends StatefulWidget {
  @override
  _BookManageListState createState() => _BookManageListState();
}

class _BookManageListState extends State<BookManageList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          child: Column(
            children: [
              ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new BookAdd()));
                  },
                  child: Text(
                    '添加图书',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new BookAdd()));
                  },
                  child: Text(
                    '添加图书',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new BookAdd()));
                  },
                  child: Text(
                    '添加图书',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              ButtonTheme(
                minWidth: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new BookAdd()));
                  },
                  child: Text(
                    '添加图书',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
