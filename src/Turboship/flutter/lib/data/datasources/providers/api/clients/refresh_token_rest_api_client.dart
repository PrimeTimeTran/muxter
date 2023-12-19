import 'package:injectable/injectable.dart';

import '../../../../../core/configs/configs.dart';
import 'base/rest_api_client.dart';

@lazySingleton
class RefreshTokenRestApiClient extends RestApiClient {
  RefreshTokenRestApiClient() : super(baseUrl: getIt<EnvConfig>().baseUrl);
}
