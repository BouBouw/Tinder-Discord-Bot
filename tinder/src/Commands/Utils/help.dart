import 'package:mineral/core/builders.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

class Help extends MineralCommand {
  Help () {
    register(CommandBuilder('help', "Page d'aide"));
  }
  
  Future<void> handle (CommandInteraction interaction) async {
    final embed = new EmbedBuilder()
    .setColor(Color.rose_500)
    .setTitle("Page d'aide")
    .addField(name: "Commande(s)", value: "`help`, `ping`");
    
    await interaction.reply(embeds: [ embed ], private: true);
  }
}