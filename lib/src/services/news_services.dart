import 'package:appnews/src/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];
  final urlbase = 'https://newsapi.org/v2';
  final urlApiKey = 'c1d259db0e5f4fdd85efa7173ddca2da';

  NewsService() {
    this.obtenerTopHeadLines();
  }
  obtenerTopHeadLines() async {
    final url = '$urlbase/top-headlines?country=us&apiKey=$urlApiKey';

    final uri = Uri.parse('$url');

    final resp = await http.get(uri);

    final newsRes = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsRes.articles);
    print(headlines);
    notifyListeners();
  }
}
