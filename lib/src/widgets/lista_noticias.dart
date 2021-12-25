import 'package:appnews/src/models/news_models.dart';
import 'package:appnews/src/theme/theme.dart';
import 'package:flutter/material.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
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
        _tarjetaBody(noticia: noticia),
        _TarjetaBotones(),
        const SizedBox(
          height: 10,
        ),
        const Divider()
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.amberAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.star_border_purple500,
              size: 35,
              color: Colors.pinkAccent,
            ),
          ),
          const SizedBox(
            width: 35,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.my_library_books_outlined,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}

class _tarjetaBody extends StatelessWidget {
  const _tarjetaBody({
    Key? key,
    required this.noticia,
  }) : super(key: key);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(
        noticia.description != null ? noticia.description! : 'Sin descripcion',
        style: const TextStyle(fontSize: 18),
      ),
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
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: const AssetImage('assets/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage!),
                    fit: BoxFit.cover,
                  )
                : const Image(
                    image: AssetImage('assets/no-image.png'),
                    fit: BoxFit.cover,
                  )),
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: const TextStyle(color: Colors.redAccent, fontSize: 25),
          ),
          Text(
            noticia.source.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 29,
            ),
          ),
        ],
      ),
    );
  }
}
