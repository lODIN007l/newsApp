import 'package:appnews/src/models/category_model.dart';
import 'package:appnews/src/services/news_services.dart';
import 'package:appnews/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsServicio =
        Provider.of<NewsService>(context).ArticulosdeCategoria!;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                //color: Colors.red,
                width: double.infinity,
                height: 100,
                child: Expanded(child: _ListaCategorias())),
            Expanded(
                child: (newsServicio.length == 0)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListaNoticias(newsServicio))
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewsService>(context).categorias;

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categorias.length,
      itemBuilder: (BuildContext context, int index) {
        final cName = categorias[index].nombre;
        return Container(
          margin: EdgeInsets.only(top: 20),
          width: 120,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryBoton(categorias[index]),
                SizedBox(
                  height: 5,
                ),
                //Caapitalizar letra
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CategoryBoton extends StatelessWidget {
  final Category categoria;

  const _CategoryBoton(this.categoria);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        //
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategoriaS = categoria.nombre;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        //pintar de cuerdo a la categoria seleccionada
        child: Icon(categoria.icon,
            color: (newService.selectedCategoriaG == this.categoria.nombre)
                ? Colors.red
                : Colors.black54),
      ),
    );
  }
}
