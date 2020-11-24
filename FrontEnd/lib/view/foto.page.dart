// A screen that allows users to take a picture using a given camera.
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myapp/controller/foto.controller.dart';
import 'package:myapp/view/service/foto.view.service.dart';

class FotoPage extends StatefulWidget {
  final FotoController fotoController;
  final FotoViewService fotoViewService;

  const FotoPage({
    Key key,
    @required this.fotoViewService,
    @required this.fotoController,
  }) : super(key: key);

  @override
  _FotoPage createState() => _FotoPage();
}

class _FotoPage extends State<FotoPage> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
        widget.fotoViewService.firstCamera, ResolutionPreset.medium,
        enableAudio: false);

    _initializeControllerFuture = _controller.initialize();

    this.widget.fotoViewService.controller = _controller;
  }

  @override
  void dispose() {
    this.widget.fotoViewService.controller = null;
    _controller.dispose();
    super.dispose();
  }

  onClickTakePicture() async {
    try {
      await _initializeControllerFuture;

      this.widget.fotoController.capturarFoto();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tire uma Foto')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: this.onClickTakePicture,
      ),
    );
  }
}
