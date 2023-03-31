import 'package:mineral/framework.dart';
import 'package:mineral/core/api.dart';

class Ban extends MineralCommand {
  Ban () {
    register(CommandBuilder('ban', 'Bannir un membre.', permissions: [ ClientPermission.banMembers ])
    ..addOption(Option(name: "target", description: "Membre a bannir", type: OptionType.user, required: true))
    ..addOption(Option(name: "reason", description: "Raison du bannissement", type: OptionType.string, required: false)));
  }
  
  Future<void> handle (CommandInteraction interaction) async {
    final target = interaction.getMember("target");
    final reason = interaction.getStringOrFail("reason");

    try {
      await target!.ban(reason: reason).then((value) {
        interaction.reply(content: "`[✅]` ${interaction.member} le membre ${target.user.tag} vient d'être bannit.", private: true);
      });
    } catch(err) {
      await interaction.reply(content: "`[❌]` ${interaction.member} une erreur est survenue lors du bannissement", private: true);
    }
  }
}