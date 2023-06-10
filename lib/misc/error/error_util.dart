import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/misc/error/error_notifier.dart';

class ErrorUtil {
  static void checkDioError(DioError error) {
    if(error.type == DioErrorType.connectionTimeout){
      throw ErrorCodes.timeout;
    }

    int statusCode = error.response!.statusCode!;

    switch(statusCode){
      case 401:
        throw ErrorCodes.unauthorized;
      case 422:
        throw ErrorCodes.wrongCredentials;
      case 404:
        throw ErrorCodes.notFound;
      case 500:
        throw ErrorCodes.server;
      default:
        throw error;
    }
  }
}