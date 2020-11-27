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

class _FotoPage extends State<FotoPage> implements IFotoRadioRepositoryChangeListner {
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
    this.widget.fotoViewService.addChangeListner(this);
  }

  @override
  void dispose() {
    this.widget.fotoViewService.controller = null;
    this.widget.fotoViewService.context = null;
    this.widget.fotoViewService.removeChangeListner(this);
    _controller.dispose();
    super.dispose();
  }

  onClickTakePicture() async {
    try {
      await _initializeControllerFuture;

      this.widget.fotoController.capturarFoto();

      Navigator.of(context).pop(true);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    this.widget.fotoViewService.context = context;
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

  @override
  onRepositoryChange() {
    this.setState(() {
      
    });
  }
}
