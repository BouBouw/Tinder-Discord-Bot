import 'package:mineral/core/builders.dart';
import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';
import 'package:mysql1/mysql1.dart';
import 'package:mineral/core/extras.dart';

import '../../handler/database_connexion.dart';
import '../../state/database_state.dart';

class Blacklist extends MineralCommand<GuildCommandInteraction> with MineralContext {
  Blacklist () {
    register(CommandBuilder('blacklist', 'Liste noire', permissions: [ ClientPermission.administrator ])
    ..addOption(Option(name: 'input', description: "Type d'interaction", type: OptionType.string, required: true)));
  }
  
  Future<void> handle (GuildCommandInteraction interaction) async {
    final con = states.use<DatabaseState>().state;
    final result = await con.connexion.query("select * from blacklist");
    List<String> array = [];

    if(result.isEmpty) {
      await interaction.reply(embeds: [ new EmbedBuilder().setColor(Color.red_500).setTitle("Liste noire :").setDescription("Aucun membre dans la liste noire.")], private: true);      
      return;
    }

    for(dynamic row in result) {
      array.add("${interaction.guild!.members.cache.get(row['userID'])}");
    }

    await interaction.reply(embeds: [ new EmbedBuilder().setColor(Color.red_500).setTitle("Liste noire :").setDescription("${array.join('\n')}") ], private: true );
  }
}