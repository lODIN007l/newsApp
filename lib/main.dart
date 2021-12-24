import 'package:appnews/src/pages/tab_page.dart';
import 'package:appnews/src/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: mitema,
        home: TabsPage());
  }
}
