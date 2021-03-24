import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Container(
            // margin: EdgeInsets.only(right: 80.0),
            child: Center(
              child: Text(
                'Avatars Page',
                style: TextStyle(color: Colors.purple[900]),
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10.0),
              padding: EdgeInsets.all(8.5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://static1.hoy.es/www/multimedia/202003/30/media/cortadas/kobe-bryant-keXD-U100728808498cNF-624x385@RC.jpg',
                ), //Aqui podria hacer un método que me organice la foto en un marco y aqui llamar a ese método
                radius: 20.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                child: Text(
                  'KB',
                  style: TextStyle(color: Colors.yellow),
                ),
                backgroundColor: Colors.purple[900],
              ),
            ),
          ],
        ),
        body: Center(
            child: FadeInImage(
          placeholder: AssetImage('assets/purple-loading.gif'),
          image: NetworkImage(
              'https://images6.alphacoders.com/524/thumb-1920-524480.jpg'),
          fadeInDuration: Duration(milliseconds: 150),
          height: 250.0,
          fit: BoxFit.cover,
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_return,
            color: Colors.purple[900],
          ),
          backgroundColor: Colors.yellow,
        ),
      );
}
