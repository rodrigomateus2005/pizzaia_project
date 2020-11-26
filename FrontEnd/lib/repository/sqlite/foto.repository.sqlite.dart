import 'dart:async';
import 'package:myapp/model/foto.dart';
import 'package:myapp/repository/galeria/foto.repository.galeria.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:sqflite/sqflite.dart';

class FotoRepositorySQLite implements IFotoRepository {
  Database _database;
  FotoRepositoryGaleria _repo;

  FotoRepositorySQLite(this._database, this._repo);

  @override
  String get nomeRepository => "Local";

  @override
  Future<bool> salvar(Foto foto) {
    Completer<bool> c = new Completer<bool>();

    String script;
    script = "INSERT INTO Foto VALUES (?, ?)";

    this._database.execute(script, [foto.uuid, foto.comentario]).then((value) {
      this._repo.salvar(foto).then((value) => c.complete(true));
    }).catchError(c.completeError);

    return c.future;
  }

  @override
  Future<List<Foto>> retornarFotos() {
    Completer<List<Foto>> c = new Completer<List<Foto>>();

    String script;
    script = "SELECT UUID, Comentario FROM Foto";

    this._database.rawQuery(script).then((value) {
      List<Foto> retorno = [];
      for (var item in value) {
        retorno.add(Foto(
            uuid: item['UUID'],
            comentario: item['Comentario'],
            url: this._repo.nomeFoto(item['UUID']),
            repoName: this.nomeRepository));
      }
      c.complete(retorno);
    }).catchError(c.completeError);

    return c.future;
  }

  @override
  Future<bool> alterar(Foto foto) {
    Completer<bool> c = new Completer<bool>();

    String script;
    script = "UPDATE Foto";
    script += "SET Comentario = ?";
    script += "WHERE UUID = ?";

    this._database.execute(script, [foto.comentario, foto.uuid]).then((value) => c.complete()).catchError(c.completeError);

    return c.future;
  }

  @override
  Future<bool> excluir(Foto foto) {
    Completer<bool> c = new Completer<bool>();

    String script;
    script = "DELETE FROM Foto WHERE UUID = ?";

    this._database.execute(script, [foto.uuid]).then((value) {
      this._repo.excluir(foto).then((value) => c.complete(true));
    }).catchError(c.completeError);

    return c.future;
  }
}
