import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

class Profile extends MineralCommand {
  Profile () {
    register(CommandBuilder('profile', 'Profile command description'));
  }
  
  Future<void> handle (CommandInteraction interaction) async {
    // Your code here
    await interaction.reply(content: 'Hello World ! 💪');
  }
}