class AppException implements Exception {
  final String? _message;
  Exception? cause;
  StackTrace? stacktrace;

  AppException(this._message, {this.cause, this.stacktrace});

  @override
  String toString() {
    return "$_message";
  }

  String get message => _message!;
}

class FetchDataException extends AppException {
  FetchDataException(String message,
      {Exception? exception, StackTrace? stacktrace})
      : super(message, cause: exception, stacktrace: stacktrace);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message,
      {Exception? exception, StackTrace? stacktrace})
      : super(message, cause: exception, stacktrace: stacktrace);
}

class InvalidInputException extends AppException {
  InvalidInputException(String message,
      {Exception? exception, StackTrace? stacktrace})
      : super(message, cause: exception, stacktrace: stacktrace);
}

class NotFoundException extends AppException {
  NotFoundException(String message,
      {Exception? exception, StackTrace? stacktrace})
      : super(message, cause: exception, stacktrace: stacktrace);
}

class BadRequestException extends AppException {
  dynamic data;

  BadRequestException(this.data) : super("Requisição inválida");
}

class InternetConnectionException extends AppException {
  InternetConnectionException({Exception? exception, StackTrace? stacktrace})
      : super("Verifique sua conexão com a internet e tente novamente.",
            cause: exception, stacktrace: stacktrace);
}
