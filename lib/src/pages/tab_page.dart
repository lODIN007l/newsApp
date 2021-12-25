import 'package:appnews/src/pages/tab1_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        onTap: (i) => navegacionModel.paginaActualS = i,
        currentIndex: navegacionModel.paginaActualG,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_outlined),
              title: Text('Para ti')),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_membership_outlined),
              title: Text('Categorias')),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel._pageControl,
      physics: BouncingScrollPhysics(),
      children: [
        Page1(),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavegacionModel extends ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageControl = PageController(initialPage: 0);
  int get paginaActualG {
    return _paginaActual;
  }

  set paginaActualS(int valor) {
    this._paginaActual = valor;
    _pageControl.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  get paginaControl => this._pageControl;
}
