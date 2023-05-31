import 'package:flutter/cupertino.dart';

@immutable
class ErrorModel {
  final bool showError;
  final String exception;
  final String errorTitle;

  const ErrorModel({
    required this.showError,
    required this.exception,
    required this.errorTitle,
  });

  ErrorModel update({bool? showError, String? exception, String? errorTitle}) {
    return ErrorModel(
      showError: showError ?? this.showError,
      exception: exception ?? this.exception,
      errorTitle: errorTitle ?? this.errorTitle,
    );
  }
}