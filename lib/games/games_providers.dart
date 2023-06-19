import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/game_model.dart';
import 'package:diploma_work_mobile/games/player_model.dart';
import 'package:diploma_work_mobile/games/player_notifier.dart';
import 'package:diploma_work_mobile/games/game_screens/active_games_notifier.dart';
import 'package:diploma_work_mobile/games/game_screens/past_games_notifier.dart';
import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';

final activeGamesProvider = AsyncNotifierProvider<ActiveGamesNotifier, List<Game>>(
      () => ActiveGamesNotifier()
);

final pastGamesProvider = AsyncNotifierProvider<PastGamesNotifier, List<PastGame>>(
        () => PastGamesNotifier()
);

final playerProvider = AsyncNotifierProvider<PlayerNotifier, Player>(
    () => PlayerNotifier()
);