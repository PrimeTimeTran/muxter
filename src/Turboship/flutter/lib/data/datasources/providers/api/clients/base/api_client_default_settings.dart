import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../mappers/response_mapper/base/base.dart';
import '../../interceptor/interceptor.dart';

class ApiClientSettings {
  const ApiClientSettings._();

  static const defaultErrorResponseMapperType = ErrorResponseMapperType.jsonObject;
  static const defaultSuccessResponseMapperType = SuccessResponseMapperType.dataJsonObject;

  static List<Interceptor> requiredInterceptors(Dio dio) => [
        if (kDebugMode) CustomLogInterceptor(),
        ConnectivityInterceptor(),
        TrimInterceptor(),
        RetryInterceptor(dio),
      ];
}
