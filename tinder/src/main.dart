import 'package:mineral/core.dart';
import 'package:mineral/core/services.dart';

import './Events/Client/ready.dart';
import './Events/Client/message_create.dart';

import './Commands/Utils/help.dart';
import './Commands/Utils/ping.dart';
import './Commands/Mod/clear.dart';
import 'Handler/database_connexion.dart';

void main () async {
  final kernel = Kernel(
    intents: IntentService(all: true),
    events: EventService([MessageCreate(), Ready()]),
    commands: CommandService([Help() ,Ping(), Clear()])
  );

  await kernel.init();

  final con = DatabaseConnexion();
  await con.open();
  print("[DB] Database has been connected.");
}
