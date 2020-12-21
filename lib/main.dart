import 'package:flutter/material.dart';
import 'package:flutter_app/pages/page_index.dart';
import 'package:flutter_app/provide/bottom_bar_provide.dart';
import 'package:provide/provide.dart';

void main() {
  var bottomBarProvider = BottomBarProvide(); //提供底部导航栏值, 获取currentIndex值
  var providers = Providers();
  providers..provide(Provider<BottomBarProvide>.value(bottomBarProvider));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '藏书管理器',
        theme: ThemeData(primaryColor: Colors.blue),
        home: IndexPage(),
      ),
    );
  }
}
