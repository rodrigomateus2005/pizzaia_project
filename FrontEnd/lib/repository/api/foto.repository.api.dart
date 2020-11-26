import 'dart:async';
import 'package:myapp/model/foto.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:openapi/api/foto_api.dart';


class FotoRepositoryApi implements IFotoRepository {
  FotoApi _api;

  FotoRepositoryApi(this._api);

  @override
  String get nomeRepository => "Nuvem";

  @override
  Future<bool> salvar(Foto foto) {
    Completer<bool> c = new Completer<bool>();

    this._api.apiFotoPost(
      uuid: foto.uuid,
      favorita: foto.favorita,
      arquivo: foto.url
    ).then((value) => c.complete(true));

    return c.future;
  }

  @override
  Future<List<Foto>> retornarFotos() {
    Completer<List<Foto>> c = new Completer<List<Foto>>();

    this._api.apiFotoGet().then((items) {
      List<Foto> retorno = [];
      
      for (var item in items.data) {
        retorno.add(new Foto(
          uuid: item.uuid,
          favorita: item.favorita,
          url: "http://127.0.0.1:5080/api/Foto/$item.uuid",
          repoName: this.nomeRepository
        ));
      }

      c.complete(retorno);
    }).catchError((err) => c.complete([]));

    return c.future;
  }

  @override
  Future<bool> alterar(Foto foto) {
    Completer<bool> c = new Completer<bool>();

    this._api.apiFotoUuidPut(foto.uuid, body: foto.favorita).then((items) => c.complete(true));

    return c.future;
  }

  @override
  Future<bool> excluir(Foto foto) {
    Completer<bool> c = new Completer<bool>();

    this._api.apiFotoUuidDelete(foto.uuid).then((items) => c.complete(true));

    return c.future;
  }
}
