import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  Color _backGroundColor = Colors.purple[900];
  Color _textColor = Colors.yellow;
  Color _color = Colors.purple[900];
  double _width = 50;
  double _height = 50;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(9.0);

  @override
  build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: _backGroundColor,
          centerTitle: true,
          title: Text(
            'Animated Page',
            style: TextStyle(color: _textColor),
          ),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,//Flutter ya trae animaciones para curvas predefinidas muy interesantes
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(borderRadius: _borderRadius, color: _color),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeTheShape,
          child: Icon(
            Icons.play_arrow,
            color: _textColor,
          ),
          backgroundColor: _backGroundColor,
        ),
      );

  _changeTheShape() {
    // Recordar que para que esos cambios sí se apliquen tengo que llamar al setState() y pasarle una funcion anonima
    final _random = Random();
    setState(() {
      _width = _random.nextInt(300).toDouble();
      _height = _random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1);

      _borderRadius = BorderRadius.circular(_random.nextInt(100).toDouble());
    });
  }
}
