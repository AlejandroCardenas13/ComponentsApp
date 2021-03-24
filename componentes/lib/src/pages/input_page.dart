import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerInputEmail = TextEditingController();
  TextEditingController _controllerInputPass = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  String _name = '';
  String _email = '';
  String _pass = '';
  String _bornDate = '';
  int _day;
  int _month;
  List<String> _powers = [
    'Inmortal',
    'Invisibility',
    'Clairvoyance',
    'Travel back in time',
    'Teleportation'
  ];
  String _opcSelected = 'Inmortal';

  Color _backGroundColor = Colors.purple[900];
  Color _textColor = Colors.yellow;
  @override
  build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: _backGroundColor,
          title: Text(
            'Inputs Page',
            style: TextStyle(color: _textColor),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          children: [
            _createInpunt(),
            Divider(
              color: _backGroundColor,
            ),
            _createEmailInput(),
            Divider(
              color: _backGroundColor,
            ),
            _createPasswordInput(),
            Divider(
              color: _backGroundColor,
            ),
            _createDate(context),
            Divider(
              color: _backGroundColor,
            ),
            _createDropDown(),
            Divider(
              color: _backGroundColor,
            ),
            _createPerson(),
          ],
        ),
      );

  _createInpunt() => TextField(
      // autofocus: true,Con este atributo el teclado se abre por defecto sin dar clic al input}
      controller: _controller,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: _backGroundColor,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          fillColor: _backGroundColor,
          counter: Text('Words: ${_name.length}'),
          counterStyle: TextStyle(color: _backGroundColor),
          hintText: 'Put your name complete',
          hintStyle: TextStyle(color: _backGroundColor),
          labelText: 'Name',
          labelStyle: TextStyle(color: _backGroundColor),
          helperText: 'Name and lastname',
          helperStyle: TextStyle(color: _backGroundColor),
          // suffixIcon: Icon(Icons.flight_land, color: _backGroundColor),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: _backGroundColor, width: 2.0)),
          suffixIcon: IconButton(
              icon: Icon(Icons.flight_land),
              color: _backGroundColor,
              onPressed: () {
                _controller.clear();
                setState(() {
                  _name = '';
                });
              }),
          icon: Icon(Icons.account_circle, color: _backGroundColor)),
      onChanged: (value) => setState(() {
            _name = value;
            // print(_name);
          }));

  _createEmailInput() => TextField(
      // autofocus: true,Con este atributo el teclado se abre por defecto sin dar clic al input}
      controller: _controllerInputEmail,
      keyboardType: TextInputType.emailAddress,
      cursorColor: _backGroundColor,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: _backGroundColor, width: 2.0)),
          fillColor: _backGroundColor,
          counter: Text('Words: ${_email.length}'),
          counterStyle: TextStyle(color: _backGroundColor),
          hintText: 'Put your email',
          hintStyle: TextStyle(color: _backGroundColor),
          labelText: 'Email',
          labelStyle: TextStyle(color: _backGroundColor),
          helperText: 'Your email',
          helperStyle: TextStyle(color: _backGroundColor),
          // suffixIcon: Icon(Icons.flight_land, color: _backGroundColor),
          suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              color: _backGroundColor,
              onPressed: () {
                _controllerInputEmail.clear();
                setState(() {
                  _email = '';
                });
              }),
          icon: Icon(Icons.alternate_email, color: _backGroundColor)),
      onChanged: (value) => setState(() {
            _email = value;
            // print(_name);
          }));

  _createPasswordInput() => TextField(
      // autofocus: true,Con este atributo el teclado se abre por defecto sin dar clic al input}
      controller: _controllerInputPass,
      obscureText: true,
      cursorColor: _backGroundColor,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: _backGroundColor, width: 2.0)),
          fillColor: _backGroundColor,
          counter: Text('Words: ${_pass.length}'),
          counterStyle: TextStyle(color: _backGroundColor),
          hintText: 'Put your password',
          hintStyle: TextStyle(color: _backGroundColor),
          labelText: 'Password',
          labelStyle: TextStyle(color: _backGroundColor),
          helperText: 'Your password',
          helperStyle: TextStyle(color: _backGroundColor),
          // suffixIcon: Icon(Icons.flight_land, color: _backGroundColor),
          suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              color: _backGroundColor,
              onPressed: () {
                _controllerInputPass.clear();
                setState(() {
                  _pass = '';
                });
              }),
          icon: Icon(Icons.lock, color: _backGroundColor)),
      onChanged: (value) => setState(() {
            _pass = value;
            // print(_name);
          }));

  Widget _createDate(BuildContext context) => TextField(
        // autofocus: true,Con este atributo el teclado se abre por defecto sin dar clic al input}
        enableInteractiveSelection: false,
        controller: _controllerDate,
        cursorColor: _backGroundColor,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: _backGroundColor, width: 2.0)),
            fillColor: _backGroundColor,
            hintText: 'Put your Born Date',
            hintStyle: TextStyle(color: _backGroundColor),
            labelText: 'Born Date',
            labelStyle: TextStyle(color: _backGroundColor),
            suffixIcon:
                Icon(Icons.perm_contact_calendar, color: _backGroundColor),
            icon: Icon(Icons.calendar_today, color: _backGroundColor)),
        onTap: () {
          print('khe pasa prrooo :v');
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        },
      );

// Está clase necesita un context porque a la hora de mostrar el DatePiker necesitamos saber quien es su padre y en donde se va a dibujar
  _selectDate(BuildContext context) async {
    _day = DateTime.now().day;
    _month = DateTime.now().month;
    DateTime picked = await showDatePicker(
        locale: Locale('es', 'ES'),
        context: context,
        initialDate: DateTime(1988),
        firstDate: DateTime(1934),
        lastDate: DateTime(2002, _month, _day));

    if (picked != null) {
      setState(() {
        _bornDate = picked.toString();
        _controllerDate.text = _bornDate;
      });
    }
  }

  List<DropdownMenuItem<String>> _getDropDownOptions() {
    List<DropdownMenuItem<String>> list = List();
    _powers.forEach((power) {
      list.add(DropdownMenuItem(
        child: Text(power, style: TextStyle(color: _backGroundColor)),
        value: power,
      ));
    });

    return list;
  }

  _createDropDown() => Row(
        children: [
          Icon(
            Icons.select_all,
            color: _backGroundColor,
          ),
          SizedBox(
            width: 30.0,
          ),
          Expanded(
            child: DropdownButton(
                value: _opcSelected,
                items: _getDropDownOptions(),
                onChanged: (opt) {
                  setState(() {
                    _opcSelected = opt;
                  });
                }),
          )
        ],
      );

  _createPerson() => ListTile(
        title: Text(
          'Your name is: $_name',
          style: TextStyle(color: _backGroundColor),
        ),
        subtitle: Text(
          'Your email is: $_email',
          style: TextStyle(color: _backGroundColor),
        ),
        trailing: Text(
          _opcSelected,
          style: TextStyle(color: _backGroundColor),
        ),
      );
}
