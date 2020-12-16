import 'package:flutter/material.dart';
import 'package:flutter_app/components/book_home_card.dart';

class bookHomeList extends StatefulWidget {
  @override
  _bookHomeListState createState() => _bookHomeListState();
}

class _bookHomeListState extends State<bookHomeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          bookHomeCard(),
          bookHomeCard(),
          bookHomeCard(),
          bookHomeCard(),
          bookHomeCard(),
          bookHomeCard(),
          bookHomeCard(),
          bookHomeCard()
        ],
      ),
    );
  }
}
