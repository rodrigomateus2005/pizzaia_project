import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/controller/tema.controller.dart';
import 'package:myapp/model/tema.dart';
import 'package:myapp/view/menu.dart';
import 'package:myapp/view/themes/claro.tema.dart';
import 'package:myapp/view/themes/escuro.tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final TemaController temaController =
      new TemaController(<Tema>[Claro(), Escuro()]);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TemaController>(
          create: (_) => temaController,
        )
      ],
      child: Consumer<TemaController>(
        builder: (_, TemaController value, __) => Observer(
          builder: (_) => MaterialApp(
            title: 'Instazzaia',
            theme: value.escolhido.data,
            home: MenuPage(value, title: 'Instazzaia'),
          ),
        ),
      ),
    );
  }
}
