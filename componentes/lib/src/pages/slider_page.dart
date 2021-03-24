import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  TextEditingController _controller = TextEditingController();
  Color _backGroundColor = Colors.purple[900];
  Color _textColor = Colors.yellow;
  double _defaultValue = 150.0, _maxValue = 400.0;
  bool _toBlockCheck = false;

  @override
  build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: _backGroundColor,
          title: Text(
            'Slider Page',
            style: TextStyle(color: _textColor),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              _createSlider(),
              _createCheckBox(),
              _createSwitch(),
              _createImage()
            ],
          ),
        ),
      );

  _createSlider() => Slider(
        label: _defaultValue
            .toInt()
            .toString(), //Label y divisions son propiedades que trabajan juntas
        divisions: _maxValue.toInt(),
        min: 100.0,
        max: _maxValue,
        activeColor: _backGroundColor,
        inactiveColor: Colors.purple[100],
        value: _defaultValue,
        onChanged: (_toBlockCheck)
            ? null
            : (value) => setState(
                  () {
                    _defaultValue = value;
                    print('1- onChanged Function');
                  },
                ),
        onChangeStart: (value) => setState(
          () {
            print('2- onChangeStart Function');
          },
        ),
        onChangeEnd: (value) => setState(
          () {
            print('3- onChangeEnd Function');
          },
        ),
      );

  Widget _createCheckBox() =>
      //Checkbox(
      CheckboxListTile(
          title: Text(
            'To block Slide with CheckBox',
            style: TextStyle(color: _backGroundColor),
          ),
          checkColor: _textColor,
          activeColor: _backGroundColor,
          value: _toBlockCheck,
          onChanged: (value) => setState(() {
                _toBlockCheck = value;
              }));

  Widget _createSwitch() => SwitchListTile(
      title: Text(
        'To block Slide with CheckBox',
        style: TextStyle(color: _backGroundColor),
      ),
      activeTrackColor: _backGroundColor,
      activeColor: _textColor,
      value: _toBlockCheck,
      onChanged: (value) => setState(() {
            _toBlockCheck = value;
          }));

  _createImage() => Expanded(
        child: FadeInImage(
            placeholder: AssetImage('assets/purple-loading.gif'),
            width: _defaultValue,
            fit: BoxFit.contain,
            image: NetworkImage(
                'https://i.pinimg.com/originals/d8/78/68/d878687be9d726434b57e6664efda0a7.png')),
      );
}