import 'package:appnews/src/pages/tab_page.dart';
import 'package:appnews/src/services/news_services.dart';
import 'package:appnews/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsService())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          theme: mitema,
          home: TabsPage()),
    );
  }
}
