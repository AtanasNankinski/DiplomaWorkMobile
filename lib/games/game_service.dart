import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/misc/error/error_util.dart';
import 'package:diploma_work_mobile/misc/util/api_config.dart';
import 'package:diploma_work_mobile/misc/util_services/interceptor.dart';
import 'package:diploma_work_mobile/games/game_model.dart';

class GameService {
  final mockedGames = [
    const Game(id: 0, title: "Mecha Polyana Game 1", description: "This is some text here he he", date: "2023-11-04", participants: 1),
    const Game(id: 1, title: "Mecha Polyana Game 2", description: "This is some text here he he", date: "2023-11-05", participants: 5),
    const Game(id: 2, title: "Mecha Polyana Game 3", description: "This is some text here he he", date: "2023-11-06", participants: 20),
    const Game(id: 3, title: "Mecha Polyana Game 4", description: "This is some text here he he", date: "2023-11-07", participants: 30),
    const Game(id: 4, title: "Mecha Polyana Game 5", description: "This is some text here he he", date: "2023-11-08", participants: 23),
    const Game(id: 5, title: "Shumen Past 1", description: "This is some text here he he", date: "2023-04-08", participants: 53),
    const Game(id: 6, title: "Shumen Past 2", description: "This is some text here he he", date: "2023-04-09", participants: 41),
  ];

  Future<bool> addGame(String title, String description, String date, int userId) async {
    try {
      final formData = FormData.fromMap({
        'game_title': title,
        'game_description':description,
        'game_date':date,
        'user_id':userId
      });

      final request = await DioInstance().dio.post(ApiConfig.addGame, data: formData);

      if(request.statusCode != null){
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          return true;
        }
      }
      return false;
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }

  Future<List<Game>> getGames() async {
    try {
      final request = await DioInstance().dio.get(ApiConfig.getGames);
      List<Game> gamesList = [];

      if(request.statusCode != null){
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          final response = request.data['games'];
          for(var game in response){
              gamesList.add(Game.fromJson(game));
          }
        }
      }
      return gamesList;
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }

  Future<void> joinGame(int userId, int replicaId, int gameId) async {
    final formData = FormData.fromMap({
      'user_id': userId,
      'replica_id':replicaId,
      'game_id':gameId,
    });
    final request = await DioInstance().dio.post(ApiConfig.createPlayer, data: formData);

    if(request.statusCode != null) {
      if(request.statusCode! >= 200 && request.statusCode! < 300) {
        return;
      }
    }
    throw "Error trying to join game.";
  }
}