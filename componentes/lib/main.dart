import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
         supportedLocales: [
    const Locale('en', ''), // English, no country code
    const Locale('es','ES'), // Hebrew, no country code
  ],
        title: 'Components',
        //Aqui definimos cuales van a ser todas las rutas(paginas con las que vamos a trabajar), esto espera que le
        //pasemos un Map <String, y una funcion que recibe un BuildContext y devuelve un Widget
        initialRoute: 'home',
        routes: getApplicationRoutes(),
        //Este atributo espera que le pasemos una funcion de tipo RouteSettings y devuelve una ruta de cualquier tipo Route<dynamic>
        onGenerateRoute: (settings) {
          //Aqui podriamos hacer que cuando una ruta no este creada nos dirija a alguna pantalla en especifico, en este caso le diremos qe nos lleve al alert_page
          print('Componente ${settings.name}');
          return MaterialPageRoute(builder: (context) => AlertPage());
        });
    // home: HomePageTemp());
    //  home: HomePage());
  }
}
