import 'package:dio/dio.dart';

import '../../../../../../core/configs/di/di.dart';
import '../../../../../../core/configs/env_config.dart';
import '../../../../../../core/constants/server/server_timeout_constants.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
  }) {
    return Dio(
      BaseOptions(
        baseUrl: options?.baseUrl ?? getIt.get<EnvConfig>().baseUrl,
        connectTimeout: options?.connectTimeout ?? ServerTimeoutConstants.connectTimeout,
        receiveTimeout: options?.receiveTimeout ?? ServerTimeoutConstants.receiveTimeout,
        sendTimeout: options?.sendTimeout ?? ServerTimeoutConstants.sendTimeout,
      ),
    );
  }
}
