import 'dart:io';

import '../base/app_exception.dart';

class ApiException extends AppException {
  final ApiExceptionKind kind;

  final int? statusCode;
  final ServerError? serverError;
  final Object? rootException;
  const ApiException({
    required this.kind,
    this.statusCode,
    this.rootException,
    this.serverError,
  }) : super(AppExceptionType.api);

  String? get generalServerMessage => serverError?.message;

  @override
  String toString() {
    return 'ApiException{kind: $kind, statusCode: $statusCode, $serverError} ${rootException != null ? 'rootException: $rootException' : ''}';
  }
}

enum ApiExceptionKind {
  noInternet,

  /// host not found, cannot connect to host
  network,

  /// server has defined response
  serverDefined,

  /// server has not defined response
  serverUndefined,

  /// error occurs when passing JSON
  decodeError,

  /// error occurs when using incorrect SuccessResponseMapperType
  invalidSuccessResponseMapperType,

  /// error occurs when using incorrect ErrorResponseMapperType
  invalidErrorResponseMapperType,

  /// error occurs when all JSON keys of error response are incorrect
  invalidErrorResponse,

  timeout,
  refreshTokenFailed,
  cancellation,
  unknown,
}

class ServerError {
  final String? errorCode;

  final String? message;
  const ServerError({
    this.errorCode,
    this.message,
  });

  @override
  String toString() {
    return 'ServerError{errorCode: $errorCode, message: $message}';
  }
}

extension ApiExceptionExtensions on ApiException {
  bool get isBadRequest => statusCode == HttpStatus.badRequest;
  bool get isForbidden => statusCode == HttpStatus.forbidden;
  bool get isNotFound => statusCode == HttpStatus.notFound;
  bool get isServerError =>
      statusCode != null && statusCode! >= HttpStatus.internalServerError;
  bool get isUnauthorized => statusCode == HttpStatus.unauthorized;
}
