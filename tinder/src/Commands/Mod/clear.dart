import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

class Clear extends MineralCommand<GuildCommandInteraction> with Console {
  Clear () {
    register(CommandBuilder('clear', 'Supprimer des messages.', permissions: [ ClientPermission.manageMessages ])
    ..addOption(Option(name: "count", description: "Nombre de message", type: OptionType.number, required: true)));
  }
  
  Future<void> handle (GuildCommandInteraction interaction) async {
    final count = interaction.getIntegerOrFail("count");
    if(count > 200 || count < 0) {
      await interaction.reply(content: "`[❓]` ${interaction.member} vous devez utiliser un nombre entre `0` et `200`.");
      return;
    }
    
      interaction.channel!.messages.bulkDelete.amount(count).then((value) {
        interaction.reply(content: "`[✅]` ${interaction.member} vous venez de supprimer **${count} message(s)**.", private: true);
      });
  }
}