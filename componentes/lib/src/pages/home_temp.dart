import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> _opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) => Center(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Componentes Temp'),
            ),
          ),
          body: ListView(
            /**
             * Dentro del ListView(Lista de elementos ) es una lista y puedo colocar dentro los widgets que yo quiera y usamos el ListTile generalmente
             */
            // children: _crearListas(),
            children: _crearItemsCorto(),
          ),
        ),
      );

  /**
       * ListTiles a partir de una lista estatica
       */
  _crearListas() {
    List<Widget> lista = List<Widget>();
    for (String opt in _opciones) {
      //En lugar de hacer esto:
      //lista.add(ListTile(title: Text(opt, textAlign: TextAlign.center)));
      // lista.add(Divider(color: Colors.green));
      //Podría declarar lista solamente una vez utlizando '..' que lo que hace es decirle al método que regrese al objeto original del cual se desprende el método add
      lista
        ..add(ListTile(
            title: Text(opt, style: TextStyle(color: Colors.blueGrey[600]))))
        ..add(Divider(color: Colors.green));
    }
    lista.removeLast();
    return lista;
  }

//Método map de las listas y ListTile
  _crearItemsCorto() {
    //el .map es un metodo para iterar las listas y lo que hace es devolverme una nueva lista donde cada uno de los elementos va a pasar por una función
    //que nosotros mismos definimos
    var widgest = _opciones
        .map(
          (item) => Column(
            children: [
              ListTile(
                  title: Text(item + '!!',
                      style: TextStyle(color: Colors.blue[800])),
                  subtitle: Text('A thing'),
                  leading:
                      // leading me permite agregar un elemento antes del title, en este caso un icono
                      Icon(Icons.account_balance_wallet, color: Colors.blue),
                  // trailing me permite agregar un elemento al final del ListTile
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.blue),
                  onTap: () => null),
              Divider(color: Colors.grey[400])
            ],
          ),
        )
        .toList();

    return widgest;
  }
}
