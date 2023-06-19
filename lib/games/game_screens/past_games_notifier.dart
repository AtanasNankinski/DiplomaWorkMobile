import 'dart:async';

import 'package:diploma_work_mobile/misc/util_services/loading_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/game_screens/past_game_model.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:diploma_work_mobile/games/game_service.dart';

class PastGamesNotifier extends  AsyncNotifier<List<PastGame>>{
  final gameService = GameService();

  @override
  FutureOr<List<PastGame>> build() async {
    List<PastGame> games = [];
    await _getGames();
    state.whenData((value) {
      games = value;
    });
    return games;
  }

  Future<void> _getGames() async {
    state = const AsyncValue.loading();
    Future.delayed(const Duration(seconds: 1));
    state = await AsyncValue.guard(() async {
      return await gameService.getPastGames();
    });
    state.whenOrNull(
      error: (error, stackTrace){
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
    );
  }

  Future<void> getGames() async {
    state = const AsyncValue.loading();
    Future.delayed(const Duration(seconds: 1));
    state = await AsyncValue.guard(() async {
      return await gameService.getPastGames();
    });
    state.when(
      data: (data) {
        ref.read(isLoadingProvider.notifier).state = false;
      },
      error: (error, stackTrace){
        ref.read(isLoadingProvider.notifier).state = false;
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
      loading: () {
        ref.read(isLoadingProvider.notifier).state = true;
      }
    );
  }
}