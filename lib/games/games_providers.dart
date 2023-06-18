import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/games_page_notifier.dart';
import 'package:diploma_work_mobile/games/game_model.dart';
import 'package:diploma_work_mobile/games/player_model.dart';
import 'package:diploma_work_mobile/games/player_notifier.dart';

final gamesPageProvider = AsyncNotifierProvider<GamesPageNotifier, List<Game>>(
      () => GamesPageNotifier()
);

final playerProvider = AsyncNotifierProvider<PlayerNotifier, Player>(
    () => PlayerNotifier()
);