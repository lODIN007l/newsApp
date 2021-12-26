import 'package:appnews/src/models/category_model.dart';
import 'package:appnews/src/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategoria = 'health';

  //business entertainment general health science sports technology
  List<Category> categorias = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];
  //mapa para categorias
  Map<String, List<Article>> categoriasArticulo = {};

  final urlbase = 'https://newsapi.org/v2';
  final urlApiKey = 'c1d259db0e5f4fdd85efa7173ddca2da';

  NewsService() {
    obtenerTopHeadLines();

    categorias.forEach((item) {
      categoriasArticulo[item.nombre] = [];
    });
  }
  get selectedCategoriaG => this._selectedCategoria;
  set selectedCategoriaS(String valor) {
    _selectedCategoria = valor;
    obtenerCategorias(valor);
    notifyListeners();
  }

  List<Article>? get ArticulosdeCategoria =>
      categoriasArticulo[selectedCategoriaG];

  obtenerTopHeadLines() async {
    final url = '$urlbase/top-headlines?country=us&apiKey=$urlApiKey';

    final uri = Uri.parse('$url');

    final resp = await http.get(uri);

    final newsRes = newsResponseFromJson(resp.body);

    this.headlines.addAll(newsRes.articles);
    print(headlines);
    notifyListeners();
  }

  obtenerCategorias(String categoria) async {
    if (this.categoriasArticulo[categoria]!.length > 0) {
      categoriasArticulo[categoria];
    }

    final url =
        '$urlbase/top-headlines?country=us&apiKey=$urlApiKey&category=$categoria';

    final uri = Uri.parse('$url');

    final resp = await http.get(uri);

    final newsRes = newsResponseFromJson(resp.body);

    categoriasArticulo[categoria]!.addAll(newsRes.articles);

    notifyListeners();
  }
}
