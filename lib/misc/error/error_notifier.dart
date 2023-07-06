import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:diploma_work_mobile/misc/error/error.dart';

class ErrorNotifier extends Notifier<ErrorModel>{
  @override
  ErrorModel build() {
    return ErrorModel(showError: false, exception: '', errorTitle: '');
  }

  void createException({
    required String exception,
    required String errorTitle
  }){
    state = state.update(showError: true, exception: exception, errorTitle: errorTitle);
  }

  void disbandError() {
    state = state.update(showError: false);
  }

  String checkError(String error) {
    switch(error) {
      case ErrorCodes.unauthorized:
        return ErrorTexts.unauthorizedText;
      case ErrorCodes.wrongCredentials:
        return ErrorTexts.wrongCredentialsText;
      case ErrorCodes.loginWrongCredentials:
        return ErrorTexts.loginWrongCredentialsText;
      case ErrorCodes.registerWrongCredentials:
        return ErrorTexts.registerWrongCredentialsText;
      case ErrorCodes.server:
        return ErrorTexts.serverText;
      default:
        createException(exception: error, errorTitle: ErrorTexts.defaultErrorTitle);
        return ErrorTexts.defaultText;
    }
  }

  void transformError(String error) {
    switch(error){
      case ErrorCodes.unauthorized:
        createException(exception: ErrorTexts.unauthorizedText, errorTitle: ErrorTexts.defaultErrorTitle);
        break;
      case ErrorCodes.wrongCredentials:
        createException(exception: ErrorTexts.wrongCredentialsText, errorTitle: ErrorTexts.defaultErrorTitle);
        break;
      case ErrorCodes.notFound:
        createException(exception: ErrorTexts.notFoundText, errorTitle: ErrorTexts.defaultErrorTitle);
        break;
      case ErrorCodes.server:
        createException(exception: ErrorTexts.serverText, errorTitle: ErrorTexts.defaultErrorTitle);
        break;
      case ErrorCodes.timeout:
        createException(exception: ErrorTexts.timeoutText, errorTitle: ErrorTexts.defaultErrorTitle);
        break;
      default:
        createException(exception: error, errorTitle: ErrorTexts.defaultErrorTitle);
    }
  }
}

class ErrorCodes {
  static const String unauthorized = "401";
  static const String wrongCredentials = "422";
  static const String loginWrongCredentials = "422_login";
  static const String registerWrongCredentials = "422_register";
  static const String notFound = "404";
  static const String server = "500";
  static const String timeout = "timeout";
}

class ErrorTexts {
  static const String unauthorizedText = "Unauthorized user.";
  static const String wrongCredentialsText = "Invalid credentials or fields.";
  static const String loginWrongCredentialsText = "Email or credentials are wrong.";
  static const String registerWrongCredentialsText = "Email is already taken or credentials are incorrect.";
  static const String serverText = "500 Server Error.";
  static const String notFoundText = "Content not found.";
  static const String defaultText = "Unknown Error.";
  static const String defaultErrorTitle = "Error";
  static const String timeoutText = "Server Timeout - Check internet connection.";
}