import 'package:mineral/core/builders.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

class Ping extends MineralCommand {
  Ping () {
    register(CommandBuilder('ping', 'Ping command description'));
  }
  
  Future<void> handle (CommandInteraction interaction) async {
    await interaction.reply(content: '`[💡]` ${interaction.member} pong!', private: true);
  }
}