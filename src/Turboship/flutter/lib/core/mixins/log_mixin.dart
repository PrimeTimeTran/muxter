import '../utils/log_util.dart';

mixin LogMixin on Object {
  void logDebug(Object? message, {String? name}) {
    LogUtil.d(message, name: runtimeType.toString());
  }

  void logError(
    Object? message, {
    dynamic error,
    StackTrace? stackTrace,
    String? name,
  }) {
    LogUtil.e(
      message,
      error: error,
      stackTrace: stackTrace,
      name: runtimeType.toString(),
    );
  }

  void logInfo(Object? message) {
    LogUtil.i(message, name: runtimeType.toString());
  }
}
