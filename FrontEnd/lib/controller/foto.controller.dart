import 'dart:async';

import 'package:myapp/model/foto.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:myapp/service/ifoto.service.dart';
import 'package:uuid/uuid.dart';

class FotoController {
  List<IFotoRepository> _fotoRepositories;
  IFotoService _fotoService;

  FotoController(this._fotoService, this._fotoRepositories);

  Future<bool> capturarFoto() {
    if (this._fotoRepositories.length == 0) {
      return Future.value(false);
    }

    return this._fotoService.capturarFotoCamera().then((url) {
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

      return true;
    });
  }

  Future<bool> _salvarFoto(Foto foto, IFotoRepository repositoryEscolhido) {
    return repositoryEscolhido.salvar(foto);
  }

  Future<bool> salvarFoto(Foto foto) {
    var repo = this._fotoRepositories.firstWhere((element) => element.nomeRepository == foto.repoName);

    if (repo == null) {
      return Future.value(false);
    }

    return this._salvarFoto(foto, repo);
  }

  Future<bool> alterarFoto(Foto foto) {
    var repo = this._fotoRepositories.firstWhere((element) => element.nomeRepository == foto.repoName);

    if (repo == null) {
      return Future.value(false);
    }

    return repo.alterar(foto);
  }

  Future<bool> excluirFoto(Foto foto) {
    var repo = this._fotoRepositories.firstWhere((element) => element.nomeRepository == foto.repoName);

    if (repo == null) {
      return Future.value(false);
    }

    return repo.excluir(foto);
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
