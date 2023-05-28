class ErrorModel {
  bool showError;
  String exception;
  String errorTitle;

  ErrorModel({
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