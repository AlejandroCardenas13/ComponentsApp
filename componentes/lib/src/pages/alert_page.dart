import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Center(
              child: Text(
            'Alerts Page',
            style: TextStyle(fontSize: 20.0, color: Colors.purple[900]),
          )),
        ),
        body: Center(
            child: RaisedButton(
          onPressed: () => _watchAlert(context),
          child: Text('Mostrar alerta',style: TextStyle(color: Colors.yellow),),
          color: Colors.purple[900],
          textColor: Colors.white,
          shape: StadiumBorder(
              side: BorderSide(width: 0.0, color: Colors.purple[900])),
        )),
        //Para crear un boton que me devuelva a la pagina anterior seria Navegator.pop(context)
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => Navigator.pop(context),
        //   child: Icon(Icons.keyboard_return),
        //   backgroundColor: Colors.amber[800],
        // ),
      );

  _watchAlert(BuildContext context) => showDialog(
        context: context,
        barrierDismissible:
            true, //Este método sirve para que cuando toque cualquier parte de la pantalla la alerta se quite (true) y (false) para que no haga nada con la alerta
        builder: (context) =>
            // Container(
            //   clipBehavior: Clip.antiAlias,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            //   child:
            AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('Primer Alerta'),
          content: Column(
            mainAxisSize: MainAxisSize
                .min, //Este atributo es para que la alerta no se estire hasta el tamaño de su padre
            children: [
              Text('Este es el contenido de la caja de alerta'),
              FlutterLogo(
                size: 60.0,
              )
            ],
          ),
          actions: [
            //Meterle más propiedades al boton
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Icon(
                Icons.done_outline,
                color: Colors.tealAccent[700],
              ),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.flash_off,
                color: Colors.redAccent[700],
              ),
            ),
          ],
        ),
      );
}
