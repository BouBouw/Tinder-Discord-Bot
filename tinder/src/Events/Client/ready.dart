import 'package:mineral/framework.dart';
import 'package:mineral/core/events.dart';

class Ready extends MineralEvent<ReadyEvent> with Console {
  Future<void> handle (event) async {
    console.success("Connecté à ${event.client.user.tag} !");
  }
}