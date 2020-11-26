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

  _toggleFavoritarFoto(Foto foto) {
    foto.favorita = !foto.favorita;
    this.widget.fotoController.alterarFoto(foto).then((value) {
      if (value) {
        setState(() {
        });
      }
    });
  }

  _excluirFoto(Foto foto) {
    this.widget.fotoController.excluirFoto(foto).then((value) {
      if (value) {
        setState(() {
          this.listaFotos.remove(foto);
        });
      }
    });
  }

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
                return new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Image.file(File(this.listaFotos[index].url)),
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: () =>
                                  _toggleFavoritarFoto(this.listaFotos[index]),
                              iconSize: 48.0,
                              color: this.listaFotos[index].favorita
                                  ? Colors.blueAccent
                                  : Colors.grey,
                            ),
                            new IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () =>
                                  _excluirFoto(this.listaFotos[index]),
                              iconSize: 48.0,
                              color: Colors.red,
                            )
                          ])
                    ]);
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
