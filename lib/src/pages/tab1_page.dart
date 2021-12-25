import 'package:appnews/src/services/news_services.dart';
import 'package:appnews/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noticias = Provider.of<NewsService>(context).headlines;

    return Scaffold(body: ListaNoticias(noticias));
  }
}
