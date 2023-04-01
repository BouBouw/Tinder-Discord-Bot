import 'package:mineral/core.dart';
import 'package:mineral/core/services.dart';

import './Events/Client/ready.dart';
import './Events/Client/message_create.dart';

import './Commands/Utils/help.dart';
import './Commands/Utils/ping.dart';
import './Commands/Mod/clear.dart';
import 'Commands/Admin/blacklist.dart';

import 'handler/logs_handler.dart';
import 'handler/database_connexion.dart';
import 'state/database_state.dart';

void main () async {
  final kernel = Kernel(
    intents: IntentService(all: true),
    events: EventService([MessageCreate(), Ready()]),
    commands: CommandService([Help(), Ping(), Clear(), Blacklist()]),
    states: SharedStateService([DatabaseState()])
  );

  await kernel.init();
}
