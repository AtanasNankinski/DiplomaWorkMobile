import 'package:dio/dio.dart';
import 'package:diploma_work_mobile/misc/util/api_config.dart';

import 'package:diploma_work_mobile/misc/util_services/shared_preferences_service.dart';
import 'package:diploma_work_mobile/auth/user_model.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final user = SharedPreferencesService().getUser();
    if(user.accessToken.isNotEmpty && user != User(id: null, name: "", email: "", userType: 0, accessToken: "")){
      options.headers['accept'] = 'application/json';
      options.headers['content-type'] = 'multipart/form-data';
      options.headers['authorization'] = "Bearer ${user.accessToken}";
      super.onRequest(options, handler);
    }else {
      handler.reject(
        DioError(
          requestOptions: options,
          error: "Unauthorized User",
          response: Response(
            statusCode: 401,
            requestOptions: options,
          ),
        ),
      );
    }
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

class DioInstance {
  final dio = createDio();

  DioInstance._internal();

  static final _singleton = DioInstance._internal();

  factory DioInstance() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: ApiConfig.androidTestEndpoint,
      receiveTimeout: Duration(seconds: 20),
      connectTimeout: Duration(seconds: 20),
      sendTimeout: Duration(seconds: 20),
    ));

    dio.interceptors.addAll({
      DioInterceptor(),
    });
    return dio;
  }
}