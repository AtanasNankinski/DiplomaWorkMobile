import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/components/past_game_container.dart';
import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';
import 'package:diploma_work_mobile/games/games_providers.dart';

class PastGamesScreen extends ConsumerWidget {
  const PastGamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PastGame> games = [];
    ref.watch(pastGamesProvider).whenData((value) {
      games = value;
    });
    final User user = ref.watch(userProvider).value ?? User.empty();

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: games.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for(var game in games)
                  PastGameContainer(game: game, user: user),
              ],
            )
          : const Center(
              child: Text("No games at the moment"),
      ),
    );
  }
}
