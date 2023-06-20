import 'dart:async';

import 'package:dio/dio.dart';
import 'package:diploma_work_mobile/games/games_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/games/player_model.dart';
import 'package:diploma_work_mobile/games/game_service.dart';
import 'package:diploma_work_mobile/misc/error/error_util.dart';
import 'package:diploma_work_mobile/misc/error/error_provider.dart';
import 'package:diploma_work_mobile/misc/error/error_notifier.dart';

class PlayerNotifier extends AsyncNotifier<Player> {
  final gameService = GameService();

  @override
  FutureOr<Player> build() {
    return Player.empty();
  }

  Future<void> joinGame(int userId, int replicaId, int gameId) async {
    try {
      await gameService.joinGame(userId, replicaId, gameId);
      ref.read(activeGamesProvider.notifier).getGames();
    } on DioError catch(e) {
      final error = ErrorUtil.checkDioErrorString(e);
      if(error == ErrorCodes.wrongCredentials) {
        ref.read(errorProvider.notifier).createException(exception: "Error trying to join game. Either there is problem with the game or you are already in that game.", errorTitle: "Join Error");
        return;
      }
      ref.read(errorProvider.notifier).transformError(error);
    } catch(e) {
      ref.read(errorProvider.notifier).transformError(e.toString());
    }
  }
}