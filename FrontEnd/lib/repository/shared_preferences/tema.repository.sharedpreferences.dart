import 'dart:async';
import 'package:myapp/model/tema.dart';
import 'package:myapp/repository/itema.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemaRepositorySharedPreferences implements ITemaRepository {
  Map<String, Tema> _temas;
  SharedPreferences _prefs;

  @override
  List<Tema> get temas => this._temas.values.toList();

  Completer _completerBuscar;

  TemaRepositorySharedPreferences(List<Tema> temas) {
    this._temas = Map.fromIterable(temas, key: (x) => x.nome, value: (x) => x);
    SharedPreferences.getInstance().then((value) {
      this._prefs = value;

      if (_completerBuscar != null) {
        this._buscar(this._completerBuscar);
      }
    });
  }

  Future<bool> salvar(Tema tema) {
    Completer c = new Completer<bool>();
    try {
      if (this._prefs != null) {
        this._prefs.setString("tema", tema.nome);
        c.complete(true);
      } else {
        c.completeError('Erro: Shared Preferences não carregou ainda');
      }
    } catch (e) {
      c.completeError(e);
    }
    return c.future;
  }

  Future<Tema> buscar() {
    Completer c = new Completer<Tema>();
    this._buscar(c);
    return c.future;
  }

  void _buscar(Completer c) {
    try {
      if (this._prefs != null) {
        String nome = this._prefs.getString("tema");
        c.complete(this._temas[nome]);
      } else {
        _completerBuscar = c;
      }
    } catch (e) {
      c.completeError(e);
    }
  }

}
