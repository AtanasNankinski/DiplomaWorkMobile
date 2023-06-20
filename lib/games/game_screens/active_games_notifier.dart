import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/game_model.dart';
import 'package:diploma_work_mobile/games/game_service.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:diploma_work_mobile/misc/util_services/loading_provider.dart';
import 'package:diploma_work_mobile/games/games_providers.dart';

class ActiveGamesNotifier extends AsyncNotifier<List<Game>> {
  final gameService = GameService();

  @override
  FutureOr<List<Game>> build() async {
    List<Game> games = [];
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
      return await gameService.getActiveGames();
    });
    state.whenOrNull(
      error: (error, stackTrace){
        ref.read(isLoadingProvider.notifier).state = false;
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
    );
  }

  Future<void> getGames() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      ref.read(isLoadingProvider.notifier).state = true;
      return await gameService.getActiveGames();
    });
    state.when(
      data: (data) {
        ref.read(isLoadingProvider.notifier).state = false;
      },
      error: (error, stackTrace){
        ref.read(isLoadingProvider.notifier).state = false;
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
      loading: (){
        ref.read(isLoadingProvider.notifier).state = true;
      },
    );
  }

  Future<void> finalizeGame(int userId, int team, int gameId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await gameService.finalizeGame(userId, team, gameId);
      ref.read(pastGamesProvider.notifier).getGames();
      return await gameService.getActiveGames();
    });
    state.when(
      data: (data) {
        ref.read(isLoadingProvider.notifier).state = false;
      },
      error: (error, stackTrace){
        ref.read(isLoadingProvider.notifier).state = false;
        ref.read(errorProvider.notifier).transformError(error.toString());
      },
      loading: (){
        ref.read(isLoadingProvider.notifier).state = true;
      },
    );
  }
}