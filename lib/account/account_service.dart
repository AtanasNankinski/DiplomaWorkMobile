import 'package:dio/dio.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/misc/util/api_config.dart';
import 'package:diploma_work_mobile/misc/util_services/interceptor.dart';
import 'package:diploma_work_mobile/misc/util_services/shared_preferences_service.dart';

class AccountService {
  Future<User> changeUsername(String name, int id) async {
    try {
      final request = await DioInstance().dio.put(
        ApiConfig.updateUsername,
        data: {
          'user_id':id,
          'name':name,
        },
      );

      if(request.statusCode != null){
        if(request.statusCode! >= 200 && request.statusCode! < 300){
          final Map<String, dynamic> userMap = request.data['user'];
          User user = SharedPreferencesService().getUser();
          user = user.updateWithMap(map: userMap);
          await SharedPreferencesService().updateUsername(user.name);
          return user;
        }
      }
      throw "Error cccured while getting the data!";
    } on DioError catch(e) {
      throw "Server Error";
    } catch(e) {
      throw "Unknown Error";
    }
  }
}