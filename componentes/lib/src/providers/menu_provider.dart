import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

// El rootBundle es el unico archivo de la libreria que necesito para leer el json
// Esta clase es para leer el archivo .json
class _MenuProvider {
  List<dynamic> _opciones = [];

  _MenuProvider() {
    // Un constructor no puede ser async
    //  _cargarData();
  }
/*
  void _cargarData() =>
      rootBundle.loadString('data/menu_opts.json').then((data) {
        Map dataMap = json.decode(data);
        print(dataMap);
        print('----------');
        print(dataMap['rutas']); 
      });
}*/
//Modificando un poco el método, recordemos que rootBundle.loadString es un metodo Future por la primera vez que se instacia la lista esta vacia
  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = jsonDecode(resp);
    _opciones = dataMap['rutas'];
    return _opciones;
  }

//Mierda preguntar pór que me sale este error cuando declaro la clase y el constructor privados y lo
// intento llamar en la clase home_page
// The following _TypeError was thrown building HomePage(dirty):
// type 'MenuProvider' is not a subtype of type '_MenuProvider' of 'function result'
// The relevant error-causing widget was:
//Ya vi que si funciona pero me toco volver a ejecutar completamente
}

final menuProvider = new _MenuProvider();
