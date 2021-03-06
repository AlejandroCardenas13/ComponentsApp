import 'package:flutter/material.dart';

final _listIcons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  'directions_bus': Icons.directions_bus,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list
};

Icon getIcon(String nameIcon) =>
    Icon(_listIcons[nameIcon], color: Colors.purple[900]);
