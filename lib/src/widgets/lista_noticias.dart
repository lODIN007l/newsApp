import 'package:appnews/src/models/news_models.dart';
import 'package:appnews/src/theme/theme.dart';
import 'package:flutter/material.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(noticias[index], index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tarjetaTopBar(noticia, index),
        _tarjetaNoticia(noticia: noticia),
        _tarjetaImagen(noticia: noticia),
      ],
    );
  }
}

class _tarjetaImagen extends StatelessWidget {
  const _tarjetaImagen({
    Key? key,
    required this.noticia,
  }) : super(key: key);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hola mundo '),
    );
  }
}

class _tarjetaNoticia extends StatelessWidget {
  const _tarjetaNoticia({
    Key? key,
    required this.noticia,
  }) : super(key: key);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _tarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _tarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: mitema.accentColor),
          ),
          Text(
            '${noticia.source.name}',
          ),
        ],
      ),
    );
  }
}
