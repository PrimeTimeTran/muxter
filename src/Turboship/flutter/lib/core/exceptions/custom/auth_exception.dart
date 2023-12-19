import 'package:flutter/material.dart';

import '../all.dart';

class AuthException extends AppException {
  final AuthExceptionKind kind;

  final Object? exception;
  const AuthException(this.kind, [this.exception])
      : super(AppExceptionType.custom);

  @override
  String toString() {
    return 'AuthException{kind: $kind, exception: $exception}';
  }
}

enum AuthExceptionKind {
  invalidCredentials,
  emailAlreadyInUse,
  emailNotFound,
  otpExpired,
  otpInvalid,
  unknown,
}

extension AuthExceptionKindTypeX on AuthExceptionKind {
  bool get isOtpException =>
      this == AuthExceptionKind.otpExpired ||
      this == AuthExceptionKind.otpInvalid;
}

extension AuthExceptionMessageKindX on AuthException {
  String message(BuildContext context) {
    switch (kind) {
      case AuthExceptionKind.invalidCredentials:
      // return context.l10n.auth_exception_invalid_credentials;
      case AuthExceptionKind.emailAlreadyInUse:
      // return context.l10n.auth_exception_email_already_taken;
      case AuthExceptionKind.otpExpired:
      case AuthExceptionKind.otpInvalid:
      // return context.l10n.auth_otp__error;
      default:
        return 'Something went wrong, please try again';
    }
  }
}
