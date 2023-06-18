import 'package:dio/dio.dart';

import 'package:diploma_work_mobile/misc/error/error_notifier.dart';

class ErrorUtil {
  static void checkDioError(DioError error) {
    if(error.type == DioErrorType.connectionTimeout){
      throw ErrorCodes.timeout;
    }
    if(error.response == null) {
      throw error;
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

  static String checkDioErrorString(DioError error) {
    if(error.type == DioErrorType.connectionTimeout){
      return ErrorCodes.timeout;
    }
    if(error.response == null) {
      return error.toString();
    }

    int statusCode = error.response!.statusCode!;

    switch(statusCode){
      case 401:
        return ErrorCodes.unauthorized;
      case 422:
        return ErrorCodes.wrongCredentials;
      case 404:
        return ErrorCodes.notFound;
      case 500:
        return ErrorCodes.server;
      default:
        return error.toString();
    }
  }
}