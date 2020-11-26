import 'package:myapp/migrations/migrate.dart';

class InitialMigrate implements IMigrate {

  @override
  String getScript() {
    String script;
    script = "CREATE TABLE Foto (";
    script += " UUID TEXT PRIMARY KEY,";
    script += " Comentario TEXT";
    script += ")";

    return script;
  }

}