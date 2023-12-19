import 'package:injectable/injectable.dart';

import '../../../../../core/configs/configs.dart';
import 'base/rest_api_client.dart';

@lazySingleton
class NoneAuthenticatedRestApiClient extends RestApiClient {
  NoneAuthenticatedRestApiClient() : super(baseUrl: getIt<EnvConfig>().baseUrl);
}
