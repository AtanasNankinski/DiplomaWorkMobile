import 'package:diploma_work_mobile/add_replica/replica_providers.dart';
import 'package:diploma_work_mobile/game_details/game_details_providers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/game_model.dart';
import 'package:diploma_work_mobile/components/section_separator.dart';
import 'package:diploma_work_mobile/games/player_model.dart';

class PlayerListScreen extends ConsumerWidget {
  const PlayerListScreen({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> withoutTeam = [];
    ref.watch(playerListProvider).whenData((value) {
      withoutTeam = value;
    });
    final redTeam = ref.watch(redTeamProvider);
    final blueTeam = ref.watch(blueTeamProvider);

    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          gameSectionSeparator("Without Team", context, true, game.participants),
          for(var player in withoutTeam)
            Container(child: Text(player.user),),
          gameSectionSeparator("Red Team", context, true, game.participants),
          gameSectionSeparator("Blue Team", context, true, game.participants),
        ],
      ),
    );
  }
}

final withoutTeamProvider = StateProvider.autoDispose<List<Player>>(
      (ref) => [],
);

final redTeamProvider = StateProvider.autoDispose<List<Player>>(
      (ref) => [],
);

final blueTeamProvider = StateProvider.autoDispose<List<Player>>(
      (ref) => [],
);