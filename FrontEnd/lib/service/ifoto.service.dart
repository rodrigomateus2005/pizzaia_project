import 'package:myapp/repository/ifoto.repository.dart';

abstract class IFotoService {

  Future<bool> capturarFotoCamera();
  Future<IFotoRepository> perguntarOndeDesejaSalvar(List<IFotoRepository> repositories);

}