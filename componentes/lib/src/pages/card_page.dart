import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Center(
            child: Text(
              'Cards Page',
              style: TextStyle(color: Colors.purple[900]),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            _typeCardOne(),
            SizedBox(height: 33.0),
            _typeCardTwo(),
            SizedBox(height: 33.0),
            _typeCardTwoImpl()
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => Navigator.pop(context),
        //   backgroundColor: Colors.orange[700],
        //   child: Icon(Icons.keyboard_return),
        // ),
      );

  _typeCardOne() => Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.photo_album,
                color: Colors.purple[900],
              ),
              title: Text('Soy el titúlo de la primera tarjeta'),
              subtitle: Text(
                  'Aquí estamos con la descripción de la tarjeta que quiero que ustedes vean para tener una idea de lo que quiero mostrarles'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                    onPressed: () => null,
                    color: Color.fromRGBO(255, 77, 77, 1),
                    child: Text(
                      'Ok',
                    )),
                FlatButton(
                    textColor: Colors.white,
                    child: Text('Cancelar'),
                    onPressed: () => null,
                    color: Color.fromRGBO(50, 255, 126, 1)),
              ],
            )
          ],
        ),
      );

  _typeCardTwo() => Card(
        //esta es la mejor forma de hacer que lo que contenga en la Card no se desborde
        // clipBehavior: Clip.antiAlias,
        clipBehavior: Clip.antiAlias,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          children: [
            //La imagen placeholder es la que deberiamos tener guardada en el proyecto en la carpeta de assets, en este caso va a ser un loading,
            //a esto le llamamos recurso estatico y mediante el pubspec.yaml le digo al proyecto que voy a hacer uso de esos recursos que guarde en
            // la carpeta assets
            FadeInImage(
              placeholder: AssetImage('assets/purple-loading.gif'),
              image: NetworkImage(
                  'https://3.bp.blogspot.com/-rHGW-Pj086E/XJqrXq3DJlI/AAAAAAAABB0/kRGUxP_OqkUmicF3bW129ubAa0myCJs9ACKgBGAs/w2560-h1600-c/sunset-horizon-scenery-landscape-art-uhdpaper.com-4K-178.jpg'),
              fadeInDuration: Duration(milliseconds: 150),
              height: 250.0,
              fit: BoxFit.cover,
            ),

            //Cuando la imagen es tan grande la imagen así tal cual parece que se sale de la card porque no se ve la forma de los bordes de la cards
            // Image(
            //   image: NetworkImage(
            //       'https://3.bp.blogspot.com/-rHGW-Pj086E/XJqrXq3DJlI/AAAAAAAABB0/kRGUxP_OqkUmicF3bW129ubAa0myCJs9ACKgBGAs/w2560-h1600-c/sunset-horizon-scenery-landscape-art-uhdpaper.com-4K-178.jpg'),
            // ),
            Container(
              child: Text('Que buen día'),
              padding: EdgeInsets.all(13.0),
            ),
          ],
        ),
      );
}

_typeCardTwoImpl() {
  final _card = Container(
    //esta es la mejor forma de hacer que lo que contenga en la Card no se desborde
    // clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        //La imagen placeholder es la que deberiamos tener guardada en el proyecto en la carpeta de assets, en este caso va a ser un loading,
        //a esto le llamamos recurso estatico y mediante el pubspec.yaml le digo al proyecto que voy a hacer uso de esos recursos que guarde en
        // la carpeta assets
        FadeInImage(
          placeholder: AssetImage('assets/orange-loading.gif'),
          image: NetworkImage(
              'https://3.bp.blogspot.com/-rHGW-Pj086E/XJqrXq3DJlI/AAAAAAAABB0/kRGUxP_OqkUmicF3bW129ubAa0myCJs9ACKgBGAs/w2560-h1600-c/sunset-horizon-scenery-landscape-art-uhdpaper.com-4K-178.jpg'),
          fadeInDuration: Duration(milliseconds: 150),
          height: 250.0,
          fit: BoxFit.cover,
        ),

        //Cuando la imagen es tan grande la imagen así tal cual parece que se sale de la card porque no se ve la forma de los bordes de la cards
        // Image(
        //   image: NetworkImage(
        //       'https://3.bp.blogspot.com/-rHGW-Pj086E/XJqrXq3DJlI/AAAAAAAABB0/kRGUxP_OqkUmicF3bW129ubAa0myCJs9ACKgBGAs/w2560-h1600-c/sunset-horizon-scenery-landscape-art-uhdpaper.com-4K-178.jpg'),
        // ),
        Container(
          child: Text('Que buen día'),
          padding: EdgeInsets.all(13.0),
        ),
      ],
    ),
  );
  return Container(
    //otra forma de hacer que lo que hay en la card no se desborde es está:
    //También es muy común que a la hora de trabajar con bordes les demos un color a estos mientras nos aseguramos que nada se este desbordando del widget padre
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(1.5, 5),
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 1.0),
        ]),
    //El widget ClipRRect() nos va a permitir cortar cualquier cosa que se encuentre fuera de ese contenedor
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: _card,
    ),
  );
}
