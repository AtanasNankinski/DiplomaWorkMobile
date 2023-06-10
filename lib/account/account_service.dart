import 'package:dio/dio.dart';

import 'package:image_picker/image_picker.dart';

import 'package:diploma_work_mobile/account/profile_pic_model.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/misc/error/error_util.dart';
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
      throw "Error occurred while getting the data!";
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }

  Future<ProfilePicModel> initialProfilePic(String color, int id) async {
    try {
      final request = await DioInstance().dio.post(ApiConfig.initialAccountPic, data: {
        'color':color,
        'user_id':id,
      });

      if(request.statusCode != null) {
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          final Map<String, dynamic> profilePicMap = request.data['account_picture'];
          final profilePic = ProfilePicModel.fromJson(profilePicMap);
          SharedPreferencesService().setAvatarColor(profilePic.color);
          return profilePic;
        }
      }
      throw "Unknown Error";
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }

  Future<String> getProfilePic(int id) async {
    try {
      final formData = FormData.fromMap({
        'user_id':id,
      });
      final request = await DioInstance().dio.get(ApiConfig.getProfilePic+'/$id', data: formData);

      if(request.statusCode != null) {
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          SharedPreferencesService().setAvatarColor("");
          return _getProfilePicUrl(id);
        }
      }
      return "";
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }

  Future<ProfilePicModel> uploadAccountPic(XFile image, int id) async {
    try {
      final imageName = image.path.split('/').last;
      final formData = FormData.fromMap({
        'user_id':id,
        'image':await MultipartFile.fromFile(image.path, filename: imageName),
      });
      final request = await DioInstance().dio.post(ApiConfig.uploadProfilePic, data: formData);

      if(request.statusCode != null) {
        if(request.statusCode! >= 200 && request.statusCode! < 300) {
          final newProfilePic = ProfilePicModel(
            image: _getProfilePicUrl(id),
            color: "",
          );
          return newProfilePic;
        }
      }
      throw "Unknown Error";
    } on DioError catch(e) {
      ErrorUtil.checkDioError(e);
      rethrow;
    } catch(e) {
      throw "Unknown Error";
    }
  }

  String _getProfilePicUrl(int id) {
    return "http://10.0.2.2:8000/api/get_profile_pic/$id";
    //return "http://192.168.100.1:8000/api/get_profile_pic/$id";
  }
}