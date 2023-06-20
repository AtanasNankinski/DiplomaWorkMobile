import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/components/modals/default_modal_body.dart';
import 'package:diploma_work_mobile/components/modals/move_player_modal.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/game_model.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/games/player_model.dart';
import 'package:diploma_work_mobile/components/player_list_container.dart';
import 'package:diploma_work_mobile/game_details/game_details_providers.dart';

class PlayerListScreen extends ConsumerWidget {
  const PlayerListScreen({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> withoutTeam = [];
    List<Player> redTeam = [];
    List<Player> blueTeam = [];
    User user = ref.watch(userProvider).value!;

    ref.watch(playerListProvider).whenData((value) {
      for(var player in value){
        switch(player.team){
          case 1:
            withoutTeam.add(player);
            break;
          case 2:
            redTeam.add(player);
            break;
          case 3:
            blueTeam.add(player);
            break;
          default:
            withoutTeam.add(player);
            break;
        }
      }
    });

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          gameSectionSeparator("Without Team", context, true, withoutTeam.length),
          for(var player in withoutTeam)
            PlayerListContainer(
              player: player,
              onTap: (){
                if(user.userType == 2) return;
                defaultModalBody(
                  context,
                  MovePlayerModal(
                    firstLabel: TeamOptions.red,
                    secondLabel: TeamOptions.blue,
                    firstChoicePressed: () {
                      Navigator.pop(context);
                      ref.read(playerListProvider.notifier).changePlayerTeam(player.id!, 2);
                    },
                    secondChoicePressed: () {
                      Navigator.pop(context);
                      ref.read(playerListProvider.notifier).changePlayerTeam(player.id!, 3);
                    },
                  ),
                );
              },
            ),
          gameSectionSeparator("Red Team", context, true, redTeam.length),
          for(var player in redTeam)
            PlayerListContainer(
              player: player,
              onTap: (){
                if(user.userType == 2) return;
                defaultModalBody(
                  context,
                  MovePlayerModal(
                    firstLabel: TeamOptions.neutral,
                    secondLabel: TeamOptions.blue,
                    firstChoicePressed: () {
                      Navigator.pop(context);
                      ref.read(playerListProvider.notifier).changePlayerTeam(player.id!, 1);
                    },
                    secondChoicePressed: () {
                      Navigator.pop(context);
                      ref.read(playerListProvider.notifier).changePlayerTeam(player.id!, 3);
                    },
                  ),
                );
              },
            ),
          gameSectionSeparator("Blue Team", context, true, blueTeam.length),
          for(var player in blueTeam)
            PlayerListContainer(
              player: player,
              onTap: (){
                if(user.userType == 2) return;
                defaultModalBody(
                  context,
                  MovePlayerModal(
                    firstLabel: TeamOptions.neutral,
                    secondLabel: TeamOptions.red,
                    firstChoicePressed: () {
                      Navigator.pop(context);
                      ref.read(playerListProvider.notifier).changePlayerTeam(player.id!, 1);
                    },
                    secondChoicePressed: () {
                      Navigator.pop(context);
                      ref.read(playerListProvider.notifier).changePlayerTeam(player.id!, 2);
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}