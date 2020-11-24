import 'dart:ui';
import 'package:myapp/model/tema.dart';
import 'package:myapp/repository/itema.repository.dart';

abstract class ITemaChangeListner {

  void onChange(Tema tema);

}

class TemaController {
  Iterator<Tema> _i;
  ITemaRepository _repository;

  Tema get escolhido => this._i.current;
  List<Tema> get _temas => this._repository.temas;

  bool get isDark => escolhido.data.brightness == Brightness.dark;

  List<ITemaChangeListner> _temaChangeListners;

  TemaController(this._repository) {
    this._temaChangeListners = <ITemaChangeListner>[];
    this._resetIterator();
    this._repository.buscar().then(this._onBuscouTema);
  }

  _resetIterator() {
    _i = this._temas.iterator;
    _i.moveNext();
  }

  mudarTema() {
    if (!_i.moveNext()) {
      this._resetIterator();
    }
    this._repository.salvar(this.escolhido);
    this._raiseChangeListner(this.escolhido);
  }

  addChangeListner(ITemaChangeListner temaChangeListner) {
    this._temaChangeListners.add(temaChangeListner);
  }

  _raiseChangeListner(Tema tema) {
    for (var listner in this._temaChangeListners) {
      listner.onChange(tema);
    }
  }

  _onBuscouTema(Tema tema) {
    this._resetIterator();
    while (this.escolhido != null && this.escolhido.nome != tema.nome) {
      this._i.moveNext();
    }
    if (this.escolhido == null) {
      this._resetIterator();
    }
    this._raiseChangeListner(tema);
  }
}
