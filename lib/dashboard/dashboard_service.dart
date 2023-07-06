import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/dashboard/score_model.dart';
import 'package:diploma_work_mobile/misc/error/error_util.dart';
import 'package:diploma_work_mobile/misc/util/api_config.dart';
import 'package:diploma_work_mobile/misc/util_services/interceptor.dart';

class DashboardService {
  Future<Score> getScore(int userId) async {
    try {
      final formData = FormData.fromMap({
        'user_id':userId,
      });

      final request = await DioInstance().dio.post(ApiConfig.getScore, data: formData);

      if(request.statusCode != null){
        if(request.statusCode! >= 200 && request.statusCode! < 300){
          final score = Score.fromJson(request.data);

          return score;
        }
      }
      return Score.empty();
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }
}