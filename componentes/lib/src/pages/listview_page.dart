import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();
  Color _backGroundColor = Colors.purple[900];
  Color _textColor = Colors.yellow;
  List<int> _listNumbers = List();
  int _lastNumber = 0;
  bool _isLoading = false;

  @override
  initState() {
    // Este método es el encargado de inicializar el ciclo de vida de un Widget, la idea es llamar aqui lo que necesite
    super.initState();
    _add10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _add10();
        _fetchData();
      }
    });
  }

  @override
  build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List Page',
          style: TextStyle(color: _textColor),
        ),
        backgroundColor: _backGroundColor,
      ),
      body: Stack(
        children: [_createList(), _createLoading()],
      ));

  Widget _createList() => RefreshIndicator(
        color: _backGroundColor,
        onRefresh: _getPageOne,
        child: ListView.builder(
            controller: _scrollController,
            itemCount: _listNumbers.length,
            itemBuilder: (BuildContext context, int index) {
              //El buildContext lo estoy creanso NO lo estoy pasando como argumento
              int _image = _listNumbers[index];
              return FadeInImage(
                  fit: BoxFit.contain,
                  placeholder: AssetImage('assets/purple-loading.gif'),
                  //Tengo que hacer que cuando termine de cargar la imagen me quede ese espacio en blando unos segundos y eso pasa por el gif
                  image:
                      NetworkImage('https://picsum.photos/500/300/?$_image'));
            }),
      );

  Widget _createLoading() {
    if (_isLoading)
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Padding(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(_backGroundColor),
              ),
              padding: EdgeInsets.only(bottom: 12.0),
            ),
          )
        ],
      );
    else
      return Container();
  }

  _add10() {
    for (var i = 0; i < 10; i++) {
      _lastNumber++;
      _listNumbers.add(_lastNumber);
    }
    // Recordar que el setState() es para hacer que el Widget se renderice
    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);

    return Timer(duration, _httpResponse);
  }

  _httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250),
        curve: Curves.fastLinearToSlowEaseIn);
    _add10();
  }

  Future<Null> _getPageOne() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _listNumbers.clear();
      _lastNumber++;
      _add10();
    });
    return Future.delayed(duration);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
