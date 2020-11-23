import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:myapp/service/ifoto.service.dart';

class FotoViewService implements IFotoService {

  IFotoRepository _repository;

  @override
  Future<bool> capturarFotoCamera() {
    
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

}