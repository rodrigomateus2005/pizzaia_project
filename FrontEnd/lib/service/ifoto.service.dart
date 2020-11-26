import 'package:myapp/repository/ifoto.repository.dart';
// import 'package:image/image.dart' as imglib;

abstract class IFotoService {

  Future<String> capturarFotoCamera();
  Future<IFotoRepository> perguntarOndeDesejaSalvar(List<IFotoRepository> repositories);

}