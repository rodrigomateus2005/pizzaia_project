import 'package:myapp/model/foto.dart';

abstract class IFotoRepository {
  
  String get nomeRepository;

  Future<bool> salvar(Foto foto);
  Future<List<Foto>> retornarFotos();
}