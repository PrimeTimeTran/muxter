import 'package:injectable/injectable.dart';

import '../models/auth/refresh_token_data.dart';
import 'providers/api/api.dart';

@lazySingleton
class RefreshTokenDatasource {
  RefreshTokenDatasource(this._client);

  final NoneAuthenticatedRestApiClient _client;

  Future<RefreshTokenData> refreshToken(String refreshToken) {
    return _client
        .post(
          '/authentication/refresh-token',
          body: {'refresh_token': refreshToken},
          decoder: (json) => RefreshTokenData.fromJson(json as Map<String, dynamic>),
        )
        .then((response) => response.data);
  }
}
