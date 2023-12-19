import 'package:flutter/material.dart';

import '../../../core/exceptions/all.dart';

typedef CustomExceptionMessageParser = String? Function(
    BuildContext context, AppException exception);

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(
    BuildContext context,
    AppException appException, {
    CustomExceptionMessageParser? customMessageParser,
  }) {
    if (customMessageParser != null) {
      final customMessage = customMessageParser(context, appException);
      if (customMessage != null) {
        return customMessage;
      }
    }

    switch (appException.type) {
      case AppExceptionType.api:
        return _parseApiException(context, appException as ApiException);
      case AppExceptionType.parse:
      case AppExceptionType.validation:
      case AppExceptionType.uncaught:
      case AppExceptionType.custom:
        return _parseCustomException(context, appException);
    }
  }

  String parseServerDefinedException(
      BuildContext context, ApiException exception) {
    return exception.generalServerMessage ?? '';
  }

  String _parseApiException(BuildContext context, ApiException exception) {
    switch (exception.kind) {
      case ApiExceptionKind.noInternet:
      // return context.l10n.exception__no_internet;
      case ApiExceptionKind.timeout:
      // return context.l10n.exception__timeout;
      case ApiExceptionKind.serverDefined:
        return parseServerDefinedException(context, exception);
      default:
        return '';
    }
  }

  String _parseCustomException(
      BuildContext context, AppException appException) {
    switch (appException.runtimeType) {
      case AuthException:
        return (appException as AuthException).message(context);
      default:
        return '';
    }
  }
}
