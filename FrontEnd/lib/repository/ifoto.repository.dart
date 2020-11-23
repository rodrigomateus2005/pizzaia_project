abstract class IFotoRepository {
  
  String get nomeRepository;

  Future<bool> salvar();
}