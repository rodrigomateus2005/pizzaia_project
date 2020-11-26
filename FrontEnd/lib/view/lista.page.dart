// A screen that allows users to take a picture using a given camera.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/controller/foto.controller.dart';
import 'package:myapp/model/foto.dart';

class ListaPage extends StatefulWidget {
  final FotoController fotoController;

  const ListaPage({
    Key key,
    @required this.fotoController,
  }) : super(key: key);

  @override
  _ListaPage createState() => _ListaPage();
}

class _ListaPage extends State<ListaPage> {
  Future<List<Foto>> _futureListaDeImagens;
  List<Foto> listaFotos;

  @override
  void initState() {
    super.initState();
    _futureListaDeImagens = widget.fotoController.retornarFotos();

    _futureListaDeImagens.then((value) => this.listaFotos = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visualize suas Foto')),
      body: FutureBuilder<void>(
        future: _futureListaDeImagens,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                return Image.file(File(this.listaFotos[index].url));
              },
              itemCount: this.listaFotos.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
