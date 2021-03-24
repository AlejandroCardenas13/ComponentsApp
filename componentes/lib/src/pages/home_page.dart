import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
            'Componentes',
            style: TextStyle(color: Colors.yellow),
          )),
          backgroundColor: Colors.purple[900]),
      body:  _lista());

  Widget _lista() {
    //Este futureBuilder lo que hace es que a partir de un metodo future me deja trabajar co su respuesta y redibujarse asi mismo,
    // Este recibe tres parametros fundamentales future que es mi metodo Future, builder que devuelve un Widget
    //Y initialData que es lo que me va a aparecer en pantalla mientras el builder se esta re dibujando, es muy común en estos casos ver un loading o algo así
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (BuildContext context,
                AsyncSnapshot<List<dynamic>> snapshot) =>
            //Acá pasamos al metopdo _listaItems() el snapshot que es la respuesta del metodo Future
            ListView(children: _listaItems(snapshot.data, context)));
    // return ListView(children: _listaItems());
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
//Otra forma de iterar
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(
          opt['texto'],
          style: TextStyle(color: Colors.purple[900]),
        ),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple[900]),
        onTap: () {
          //Esta es una forma de implementar el llamado a otras vistas por medio del metodo Navegator.push que espera el contexto esto para saber
          // en donde esta parado, su diseño y demas cosas y el route que es el widget o la pagina a la que me va a enviar
          //El unico problema con esta implementación es que todas las listas me llevan a AlertPage
          /* final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);*/
          //Otra forma de implementarlo sería: routeName -> deberia ser el nombre que esta definido en el .json, pero para esto esas rutas
          //deben estar configuradas en alguna parte
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider(color: Colors.purple[900]));
    });

    return opciones;
  }
}
