import 'package:mineral/framework.dart';
import 'package:mineral/core/events.dart';
import 'package:mysql1/mysql1.dart';

import '../handler/database_connexion.dart';
import '../managers/database_manager.dart';

class DatabaseState extends MineralState<DatabaseManager> {
  DatabaseState(): super(DatabaseManager());

  void setDatabase(DatabaseManager db) => state = db;
}