import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/game_details/game_details_screen/player_list_notifier.dart';
import 'package:diploma_work_mobile/games/player_model.dart';

final playerListProvider = AsyncNotifierProvider<PlayerListNotifier, List<Player>>(
    () => PlayerListNotifier()
);