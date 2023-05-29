import 'dart:convert';

import 'package:diploma_work_mobile/util_services/shared_preferences_service.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/auth/user_model.dart';
import 'package:diploma_work_mobile/util/api_config.dart';
import 'package:diploma_work_mobile/util_services/interceptor.dart';

class AuthService {
  final Dio _dio = Dio();

  AuthService(){
    _dio.interceptors.add(DioInterceptor());
  }

  Future<void> logout() async {
    try {
      await _dio.post(ApiConfig.androidTestEndpoint + ApiConfig.logout);
      await SharedPreferencesService().clearUser();
    } on DioError catch(e) {

    } catch(e) {
      throw "Unknown error occurred: $e";
    }
  }

  Future<User> register(String email, String password) async {
    try {
      final String url = ApiConfig.androidTestEndpoint + ApiConfig.register;
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email' : email,
          'password' : password,
          'password_confirmation' : password
        },
      );
      if(response.statusCode >= 200 && response.statusCode < 300){
        final user = jsonDecode(response.body);
        return User.fromJson(user);
      }
      return User(id: null, name: "", email: "", userType: 0, accessToken: "");
    } catch(e) {
      throw "Server error occured: ${e.toString()}";
    }
  }
}