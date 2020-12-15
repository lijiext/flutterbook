import 'package:flutter/material.dart';

class bookHomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //
    return Container(
      height: 150,
      child: Card(
        // color: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Container(
                height: 64,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: new AssetImage(
                            'assets/img/firstLineOfCode.jpg'),
                        fit: BoxFit.fill)),
              ),
              title: Text(
                '第一行代码',
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text('郭霖', style: const TextStyle(fontSize: 16),),

            ),
          ],
        ),
      ),
    );
  }
}
