import 'dart:async';

import 'package:myapp/model/foto.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:myapp/service/ifoto.service.dart';
import 'package:uuid/uuid.dart';

class FotoController {
  List<IFotoRepository> _fotoRepositories;
  IFotoService _fotoService;

  FotoController(this._fotoService, this._fotoRepositories);

  capturarFoto() {
    if (this._fotoRepositories.length == 0) {
      return;
    }

    this._fotoService.capturarFotoCamera().then((url) {
      var uuid = Uuid();
      var foto = new Foto(uuid: uuid.v1().toString(), url: url);

      if (this._fotoRepositories.length > 1) {
        this
            ._fotoService
            .perguntarOndeDesejaSalvar(this._fotoRepositories)
            .then((respostaOndeSalvar) {
          this._salvarFoto(foto, respostaOndeSalvar);
        });
      } else {
        this._salvarFoto(foto, this._fotoRepositories[0]);
      }
    });
  }

  _salvarFoto(Foto foto, IFotoRepository repositoryEscolhido) {
    repositoryEscolhido.salvar(foto);
  }

  Future<List<Foto>> retornarFotos() {
    Completer<List<Foto>> c = new Completer<List<Foto>>();
    List<Foto> retorno = [];
    List<Future> futures = [];

    for (var repo in this._fotoRepositories) {
      futures.add(repo.retornarFotos().then((value) => retorno.addAll(value)));
    }

    Future.wait(futures).then((value) => c.complete(retorno));

    return c.future;
  }
}
