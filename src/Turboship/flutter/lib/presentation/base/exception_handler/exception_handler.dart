import 'package:flutter/material.dart';

import '../../../core/exceptions/all.dart';
import '../../utils/app_utils.dart';

class ExceptionHandler {
  const ExceptionHandler({
    required this.context,
    required this.listener,
  });

  final BuildContext context;
  final ExceptionHandlerListener listener;

  Future<void> handleException(
    AppExceptionWrapper appExceptionWrapper,
    String commonExceptionMessage,
  ) async {
    final message = appExceptionWrapper.overrideMessage ?? commonExceptionMessage;

    switch (appExceptionWrapper.appException.type) {
      case AppExceptionType.api:
        final exception = appExceptionWrapper.appException as ApiException;
        switch (exception.kind) {
          case ApiExceptionKind.refreshTokenFailed:
            // await _showErrorDialog(
            //   isRefreshTokenFailed: true,
            //   message: message,
            //   onPressed: () {},
            // );
            break;
          case ApiExceptionKind.noInternet:
          case ApiExceptionKind.network:
            return _showErrorToast(message: message);

          case ApiExceptionKind.timeout:
            // await _showErrorDialogWithRetry(
            //   message: message,
            //   onRetryPressed: () {},
            // );
            break;
          case ApiExceptionKind.serverDefined:
            return _showErrorToast(message: message);
          default:
            // await _showErrorDialog(message: message);
            break;
        }
        break;
      case AppExceptionType.parse:
        return;
      // return _showErrorSnackBar(message: message);
      case AppExceptionType.uncaught:
        return;
      case AppExceptionType.validation:
        // await _showErrorDialog(message: message);
        break;
      case AppExceptionType.custom:
        return _showErrorToast(message: message);
    }
  }

  void _showErrorToast({
    required String message,
  }) {
    AppUtils.showErrorToast(context, message);
  }

  // Future<void> _showErrorDialog({
  //   required String message,
  // }) async {
  // await navigator
  //     .showDialog(
  //   AppPopupInfo.confirmDialog(
  //     message: message,
  //     onPressed: onPressed,
  //   ),
  // )
  //     .then((value) {
  //   if (isRefreshTokenFailed) {
  //     listener.onRefreshTokenFailed();
  //   }
  // });
  // }

  // Future<void> _showErrorDialogWithRetry({
  //   required String message,
  //   required VoidCallback onRetryPressed,
  // }) async {
  // await navigator.showDialog(
  //   AppPopupInfo.errorWithRetryDialog(
  //     message: message,
  //     onRetryPressed: onRetryPressed,
  //   ),
  // );
  // }
}

abstract class ExceptionHandlerListener {
  void onRefreshTokenFailed();
}
