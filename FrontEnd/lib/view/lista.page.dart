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
        setState(() {});
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

  ImageProvider criarImage(Foto foto) {
    if (foto.repoName == "Nuvem") {
      return NetworkImage(foto.url);
    } else {
      return FileImage(File(foto.url));
    }
    
  }

  Widget criarIconeLocal(Foto foto) {
    if (foto.repoName == "Nuvem") {
      return new Stack(
                            children: <Widget>[
                              new Positioned(
                                right: 0.0,
                                bottom: 0.0,
                                child: Icon(Icons.cloud, color: Colors.blue)
                              ),
                            ],
                          );
    } else {
      return null;
    }
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
                      Container(
                          constraints: new BoxConstraints.expand(
                            height: 200.0,
                          ),
                          padding: new EdgeInsets.only(
                              left: 16.0, bottom: 8.0, right: 16.0),
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: this.criarImage(this.listaFotos[index]),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          child: this.criarIconeLocal(this.listaFotos[index]) // aki
                          ),
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
