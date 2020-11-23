import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:myapp/model/tema.dart';

class TemaController {
  Iterator<Tema> i;
  List<Tema> temas;

  @observable
  Tema escolhido;

  @computed
  bool get isDark => escolhido.data.brightness == Brightness.dark;

  TemaController(this.temas) {
    this.resetIterator();
    this.atualizarEscolhido();
  }

  resetIterator() {
    i = this.temas.iterator;
    i.moveNext();
  }

  atualizarEscolhido() {
    escolhido = i.current;
  }

  @action
  mudarTema() {
    if (!i.moveNext()) {
      this.resetIterator();
    }
    this.atualizarEscolhido();
  }
}
