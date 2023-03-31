import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

class Unmute extends MineralCommand {
  Unmute () {
    register(CommandBuilder('unmute', 'Unmute command description'));
  }
  
  Future<void> handle (CommandInteraction interaction) async {
    // Your code here
    await interaction.reply(content: 'Hello World ! 💪');
  }
}