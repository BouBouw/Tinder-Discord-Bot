import 'package:mineral/core/extras.dart';
import 'package:mysql1/mysql1.dart';

class DatabaseConnexion with MineralContext {
  late final connexion;

  Future<void> open () async {
    final settings = new ConnectionSettings(
      host: environment.getOrFail("_host"),
      user: environment.getOrFail("_user"),
      db: environment.getOrFail("_db"),
      port: int.parse(environment.getOrFail("_port"))
    );

    connexion = await MySqlConnection.connect(settings);
  }
}