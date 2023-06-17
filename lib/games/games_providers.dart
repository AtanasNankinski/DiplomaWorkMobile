import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/games_page_notifier.dart';
import 'package:diploma_work_mobile/games/game_model.dart';

final gamesPageNotifier = AsyncNotifierProvider<GamesPageNotifier, List<Game>>(
        () => GamesPageNotifier()
);