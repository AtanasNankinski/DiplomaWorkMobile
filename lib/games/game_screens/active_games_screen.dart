import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/auth/auth_providers.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/components/game_container.dart';
import 'package:diploma_work_mobile/games/game_model.dart';
import 'package:diploma_work_mobile/games/games_providers.dart';

class ActiveGamesScreen extends ConsumerWidget {
  const ActiveGamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Game> games = [];
    ref.watch(activeGamesProvider).whenData((value) {
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
                    GameContainer(game: game, user: user),
                  ],
                )
              : const Center(
                  child: Text("No games at the moment"),
                ),
    );
  }
}
