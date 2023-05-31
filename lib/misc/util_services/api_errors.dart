enum AuthErrors {
  BAD_REQUEST,
  UNAUTHORIZED,
  FORBIDDEN,
  NOT_FOUND,
  SERVER_ERROR,
  OTHER,
}

class ErrorHandling {
  static AuthErrors handleError(int? statusCode) {
    if(statusCode != null) {
      switch(statusCode) {
        case 400:
          return AuthErrors.BAD_REQUEST;
        case 401:
          return AuthErrors.UNAUTHORIZED;
        case 403:
          return AuthErrors.NOT_FOUND;
        case 404:
          return AuthErrors.SERVER_ERROR;
        case 500:
          return AuthErrors.OTHER;
      }
    }
    throw AuthErrors.OTHER;
  }
}