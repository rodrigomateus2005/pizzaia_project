import 'package:myapp/repository/ifoto.repository.dart';
import 'package:myapp/service/ifoto.service.dart';

class FotoController {

  List<IFotoRepository> fotoRepositories;
  IFotoService fotoService;

  FotoController(IFotoService fotoService, List<IFotoRepository> fotoRepositories) {
    this.fotoRepositories = fotoRepositories;
    this.fotoService = fotoService;
  }
  
  capturarFoto() {
    this.fotoService.capturarFotoCamera().then((imagem) {
      if (this.fotoRepositories.length == 0) {
        return;
      }

      if (this.fotoRepositories.length > 1) {
        this.fotoService.perguntarOndeDesejaSalvar(this.fotoRepositories).then((respostaOndeSalvar) {
          this.salvarFoto(respostaOndeSalvar);
        });
      } else {
        this.salvarFoto(this.fotoRepositories[0]);
      }
    });
  }

  salvarFoto(IFotoRepository repositoryEscolhido) {
    repositoryEscolhido.salvar();
  }

  retornarFotos() {

  }

}