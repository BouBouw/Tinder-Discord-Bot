import 'package:mineral/core/extras.dart';
import 'package:mysql1/mysql1.dart';

import '../state/database_state.dart';
import '../managers/database_manager.dart';

class DatabaseConnexion with MineralContext {
  Future<void> open () async {
    final settings = new ConnectionSettings(
      host: environment.getOrFail("_host"),
      user: environment.getOrFail("_user"),
      db: environment.getOrFail("_db"),
      port: int.parse(environment.getOrFail("_port"))
    );

    final con = states.use<DatabaseState>();
    final db = await MySqlConnection.connect(settings);

    DatabaseManager dbManager = DatabaseManager();
    dbManager.setConnexion(db);
    con.setDatabase(dbManager);
  }
}