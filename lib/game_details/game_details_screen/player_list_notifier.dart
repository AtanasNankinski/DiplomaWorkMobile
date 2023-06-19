import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/player_model.dart';
import 'package:diploma_work_mobile/game_details/game_details_service.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:diploma_work_mobile/misc/util_services/loading_provider.dart';
import 'package:diploma_work_mobile/misc/error/error_notifier.dart';

class PlayerListNotifier extends AsyncNotifier<List<Player>>{
  final gameDetailsService = GameDetailsService();

  @override
  FutureOr<List<Player>> build() {
    return [];
  }

  Future<void> getPlayers(int gameId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await gameDetailsService.getPlayers(gameId);
    });
    state.when(
        data: (data) {
          ref.read(isLoadingProvider.notifier).state = false;
        },
        error: (error, stackTrace){
          if(error == ErrorCodes.notFound) {
            return;
          }
          ref.read(isLoadingProvider.notifier).state = false;
          ref.read(errorProvider.notifier).transformError(error.toString());
        },
        loading: () {
          ref.read(isLoadingProvider.notifier).state = true;
        }
    );
  }
}