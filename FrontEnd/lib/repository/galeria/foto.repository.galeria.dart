import 'dart:async';
import 'dart:io';
import 'package:myapp/model/foto.dart';
import 'package:myapp/repository/ifoto.repository.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FotoRepositoryGaleria implements IFotoRepository {
  String _path;
  FotoRepositoryGaleria() {
    getApplicationDocumentsDirectory().then((value) {
      this._path = value.path;
    });
  }

  @override
  String get nomeRepository => "Galeria";

  @override
  Future<bool> salvar(Foto foto) {
    Completer<bool> c = new Completer();

    String novoCaminho = this.nomeFoto(foto.uuid);
    File(foto.url).copy(novoCaminho).then((value) {
      foto.url = novoCaminho;
      GallerySaver.saveImage(foto.url);
      c.complete(true);
    });

    return c.future;
  }

  @override
  Future<List<Foto>> retornarFotos() {
    return null;
  }

  String nomeFoto(String uuid) {
    return join(this._path, uuid + '.png');
  }
}
