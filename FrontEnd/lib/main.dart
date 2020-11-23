import 'package:flutter/material.dart';
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

class _MyApp extends State<MyApp> implements ITemaChangeListner {
  final TemaController temaController =
      new TemaController(<Tema>[Claro(), Escuro()]);

  _MyApp() {
    temaController.addChangeListner(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TemaController>(
          create: (_) => temaController,
        )
      ],
      child: MaterialApp(
        title: 'Instazzaia',
        theme: temaController.escolhido.data,
        home: MenuPage(temaController, title: 'Instazzaia'),
      ),
    );
  }

  @override
  void onChange(Tema tema) {
    this.setState(() => {});
  }
}
