import 'package:flutter/material.dart';
import 'package:myapp/controller/foto.controller.dart';
import 'package:myapp/controller/tema.controller.dart';

class MenuPage extends StatefulWidget {
  final TemaController temaController;
  final FotoController fotoController;

  MenuPage(this.temaController, this.fotoController, {Key key, this.title})
      : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  void _takePicture() {
    Navigator.pushNamed(context, '/foto');
  }

  void _openPhotos() {
    widget.fotoController.capturarFoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: widget.temaController.mudarTema,
                child: Icon(Icons.highlight),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _openPhotos,
              child:
                  const Text('Visualizar Fotos', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        tooltip: 'Tirar Foto',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
