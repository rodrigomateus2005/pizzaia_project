import 'package:flutter/material.dart';
import 'package:myapp/model/tema.dart';

class Claro extends Tema {

  @override
  ThemeData get data => ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light
  );

  @override
  String get nome => "Claro";

}