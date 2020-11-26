import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:myapp/service/ifoto.service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

abstract class IFotoRadioRepositoryChangeListner {
  onRepositoryChange();
}

class FotoViewService implements IFotoService {
  List<CameraDescription> _cameras;
  IFotoRepository _repository;

  CameraController _controller;
  BuildContext _context;

  List<IFotoRadioRepositoryChangeListner> _listners = [];

  CameraDescription get firstCamera => this._cameras.first;

  set controller(CameraController value) {
    this._controller = value;
  }

  set context(BuildContext value) {
    this._context = value;
  }

  FotoViewService(this._cameras);

  @override
  Future<String> capturarFotoCamera() {
    if (this._controller == null) {
      return Future.value(null);
    }
    Completer<String> c = new Completer<String>();
    getTemporaryDirectory().then((value) {
      var pathImg = join(value.path, "${DateTime.now().toUtc()}.png");
      this._controller.takePicture(pathImg).then((value) {
        c.complete(pathImg);
      });
    });
    return c.future;
  }

  @override
  Future<IFotoRepository> perguntarOndeDesejaSalvar(
      List<IFotoRepository> repositories) {
    Completer<IFotoRepository> c = new Completer<IFotoRepository>();
    showDialog(
        context: this._context,
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
        });
    return c.future;
  }

  List<Widget> getRadioButtons(List<IFotoRepository> repositories) {
    List<Widget> retorno = new List<RadioListTile>();

    for (var repo in repositories) {
      retorno.add(RadioListTile<IFotoRepository>(
        title: Text(repo.nomeRepository),
        value: repo,
        groupValue: this._repository,
        onChanged: (IFotoRepository value) {
          this._repository = value;
          this._raiseChangeListner();
        },
      ));
    }

    return retorno;
  }

  addChangeListner(IFotoRadioRepositoryChangeListner fotoRadioRepositoryChangeListner) {
    this._listners.add(fotoRadioRepositoryChangeListner);
  }

  removeChangeListner(IFotoRadioRepositoryChangeListner fotoRadioRepositoryChangeListner) {
    this._listners.remove(fotoRadioRepositoryChangeListner);
  }

  _raiseChangeListner() {
    for (var listner in this._listners) {
      listner.onRepositoryChange();
    }
  }
}
