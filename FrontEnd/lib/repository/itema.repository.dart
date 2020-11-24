import 'package:myapp/model/tema.dart';

abstract class ITemaRepository {
  List<Tema> get temas;
  Future<bool> salvar(Tema tema);
  Future<Tema> buscar();
}