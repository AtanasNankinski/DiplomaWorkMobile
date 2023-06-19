import 'package:dio/dio.dart';
import 'package:diploma_work_mobile/add_replica/replica_model.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';

import 'package:diploma_work_mobile/games/player_model.dart';
import 'package:diploma_work_mobile/misc/error/error_util.dart';
import 'package:diploma_work_mobile/misc/util/api_config.dart';
import 'package:diploma_work_mobile/misc/util_services/interceptor.dart';

class GameDetailsService {
  Future<List<Player>> getPlayers(int gameId) async {
    try {
      final formData = FormData.fromMap({
        'game_id':gameId,
      });
      List<Player> players = [];

      final request = await DioInstance().dio.post(ApiConfig.getPlayers, data: formData);

      if(request.statusCode != null){
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          final response = request.data['players'];
          for(var player in response){
            int id = player['id'];
            String user = player['user'];
            final replica = player['replica'];
            String name = replica['replica_name'];
            String type = replica['replica_type'];
            double power = replica['replica_power'].toDouble();
            Replica convReplica = Replica(replicaName: name, replicaType: type, replicaPower: power);
            int team = player['team'];

            players.add(Player(id: id, user: user, replica: convReplica, team: team));
          }
        }
      }

      return players;
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }
}