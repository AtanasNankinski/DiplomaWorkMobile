import 'dart:convert';

import 'package:diploma_work_mobile/util_services/api_errors.dart';
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

  Future<User> logout() async {
    try {
      await _dio.post(ApiConfig.androidTestEndpoint + ApiConfig.logout);
      await SharedPreferencesService().clearUser();
      return SharedPreferencesService().getUser();
    } on DioError catch(e) {
      if(e.response != null){
        if(e.response!.statusCode == 401) {
          SharedPreferencesService().clearUser();
          return SharedPreferencesService().getUser();
        }
      }
      throw "Unknown error occurred: $e";
    } catch(e) {
      throw "Unknown error occurred: $e";
    }
  }

  Future<User> login(String email, String password) async {
    try {
      final String url = ApiConfig.androidTestEndpoint + ApiConfig.login;
      final response = await http.post(
        Uri.parse(url),
        body: {
          'email' : email,
          'password' : password,
        },
      );
      if(response.statusCode >= 200 && response.statusCode < 300){
        final user = jsonDecode(response.body);
        final convUser = User.fromJson(user);
        SharedPreferencesService().setUser(convUser.id!, convUser.name, convUser.email, convUser.userType, convUser.accessToken);
        return convUser;
      }else if(response.statusCode == 401){
        throw "401";
      }
      return User(id: null, name: "", email: "", userType: 0, accessToken: "");
    } catch(e) {
      rethrow;
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
        final convUser = User.fromJson(user);
        SharedPreferencesService().setUser(convUser.id!, convUser.name, convUser.email, convUser.userType, convUser.accessToken);
        return convUser;
      }else if(response.statusCode == 422){
        throw "422";
      }
      return User(id: null, name: "", email: "", userType: 0, accessToken: "");
    } catch(e) {
      rethrow;
    }
  }
}