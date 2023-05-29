import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/util_services/shared_preferences_service.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final user = SharedPreferencesService().getUser();
    if(user.accessToken.isNotEmpty && user != User(id: null, name: "", email: "", userType: 0, accessToken: "")){
      options.headers['accept'] = 'application/json';
      options.headers['authorization'] = "Bearer ${user.accessToken}";
    }else {
      handler.reject(DioError(requestOptions: options, error: "Unauthorized user"));
    }
    super.onRequest(options, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode != null){
      handler.reject(err);
    }else {
      super.onError(err, handler);
    }
  }
}