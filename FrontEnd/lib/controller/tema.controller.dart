import 'dart:ui';
import 'package:myapp/model/tema.dart';

abstract class ITemaChangeListner {

  void onChange(Tema tema);

}

class TemaController {
  Iterator<Tema> i;
  List<Tema> temas;

  Tema get escolhido => this.i.current;

  bool get isDark => escolhido.data.brightness == Brightness.dark;

  List<ITemaChangeListner> temaChangeListners;

  TemaController(this.temas) {
    this.temaChangeListners = <ITemaChangeListner>[];
    this.resetIterator();
  }

  resetIterator() {
    i = this.temas.iterator;
    i.moveNext();
  }

  mudarTema() {
    if (!i.moveNext()) {
      this.resetIterator();
    }
    this.raiseChangeListner(this.escolhido);
  }

  addChangeListner(ITemaChangeListner temaChangeListner) {
    this.temaChangeListners.add(temaChangeListner);
  }

  raiseChangeListner(Tema tema) {
    for (var listner in this.temaChangeListners) {
      listner.onChange(tema);
    }
  }
}
