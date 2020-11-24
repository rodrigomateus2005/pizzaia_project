import 'dart:async';
import 'package:image/image.dart' as imglib;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:myapp/service/ifoto.service.dart';

class FotoViewService implements IFotoService {

  List<CameraDescription> _cameras;
  IFotoRepository _repository;

  CameraController _controller;

  CameraDescription get firstCamera => this._cameras.first;

  set controller(CameraController value) {
    this.controller = value;
  }
  FotoViewService(this._cameras);

  @override
  Future<bool> capturarFotoCamera() {
    if (this._controller == null) {
      return Future.value(false);
    }
    Completer c = new Completer();
    this._controller.startImageStream((image) {
      this._convertYUV420toImageColor(image).then((value) {
        c.complete(value);
      }).catchError(c.completeError);
    }).catchError(c.completeError);
    return c.future;
  }

  @override
  Future<IFotoRepository> perguntarOndeDesejaSalvar(List<IFotoRepository> repositories) {
    Completer c = new Completer();
    showDialog(
      context: null,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Escolha aonde deseja salvar a foto'),
          content: Column(
            children: getRadioButtons(repositories),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                c.complete(this._repository);
              },
            ),
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                c.complete(null);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
    return c.future;
  }

  List<Widget> getRadioButtons(List<IFotoRepository> repositories) {
    List<Widget> retorno = new List<RadioListTile>();

    for (var repo in repositories) {
      retorno.add(
        RadioListTile<IFotoRepository>(
          title: Text(repo.nomeRepository),
          value: repo,
          groupValue: this._repository,
          onChanged: (IFotoRepository value) {
            this._repository = value;
          },
        )
      );
    }

    return retorno;
  }

  Future<imglib.Image> _convertYUV420toImageColor(CameraImage image) async {
  try {
    final int width = image.width;
    final int height = image.height;
    final int uvRowStride = image.planes[1].bytesPerRow;
    final int uvPixelStride = image.planes[1].bytesPerPixel;

    print("uvRowStride: " + uvRowStride.toString());
    print("uvPixelStride: " + uvPixelStride.toString());

    // imgLib -> Image package from https://pub.dartlang.org/packages/image
    var img = imglib.Image(width, height); // Create Image buffer

    // Fill image buffer with plane[0] from YUV420_888
    for(int x=0; x < width; x++) {
      for(int y=0; y < height; y++) {
        final int uvIndex = uvPixelStride * (x/2).floor() + uvRowStride*(y/2).floor();
        final int index = y * width + x;

        final yp = image.planes[0].bytes[index];
        final up = image.planes[1].bytes[uvIndex];
        final vp = image.planes[2].bytes[uvIndex];
        // Calculate pixel color
        int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
        int g = (yp - up * 46549 / 131072 + 44 -vp * 93604 / 131072 + 91).round().clamp(0, 255);
        int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);     
        // color: 0x FF  FF  FF  FF 
        //           A   B   G   R
        img.data[index] = (0xFF << 24) | (b << 16) | (g << 8) | r;
      }
    }

    return img;
  } catch (e) {
    print(">>>>>>>>>>>> ERROR:" + e.toString());
  }
  return null;
}

}