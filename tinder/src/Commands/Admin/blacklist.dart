import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

import '../../Handler/database_connexion.dart';

class Blacklist extends MineralCommand {
  Blacklist () {
    register(CommandBuilder('blacklist', 'Blacklist command description'));
  }
  
  Future<void> handle (CommandInteraction interaction) async {
    final con = DatabaseConnexion();

    await con.connexion.query("SELECT * FROM blacklist", ()  {

    });
    // Your code here
    await interaction.reply(content: 'Hello World ! 💪');
  }
}