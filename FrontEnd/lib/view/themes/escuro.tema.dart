import 'package:flutter/material.dart';
import 'package:myapp/model/tema.dart';

class Escuro extends Tema {

  @override
  ThemeData get data => ThemeData(
    primaryColor: Colors.yellow,
    brightness: Brightness.dark
  );

  @override
  String get nome => "Escuro";

}