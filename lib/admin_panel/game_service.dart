import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/misc/error/error_util.dart';
import 'package:diploma_work_mobile/misc/util/api_config.dart';
import 'package:diploma_work_mobile/misc/util_services/interceptor.dart';

class GameService {
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
}