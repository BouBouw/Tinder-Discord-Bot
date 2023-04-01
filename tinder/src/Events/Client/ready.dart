import 'package:mineral/framework.dart';
import 'package:mineral/core/events.dart';

import '../../Handler/database_connexion.dart';

class Ready extends MineralEvent<ReadyEvent> with Console {
  Future<void> handle(event) async {
    console.success("[API] Connected to ${event.client.user.tag}");
    await DatabaseConnexion().open();
    console.success("[DB] Database has been connected.");
  }
}
