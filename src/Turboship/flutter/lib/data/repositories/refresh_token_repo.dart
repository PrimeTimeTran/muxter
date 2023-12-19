import 'package:injectable/injectable.dart';

import '../../core/exceptions/all.dart';
import '../../core/extensions/all.dart';
import '../datasources/all.dart';

@lazySingleton
class RefreshTokenRepository {
  RefreshTokenRepository(this._datasource, this._appPreferences);

  final RefreshTokenDatasource _datasource;
  final AppPreferences _appPreferences;

  // Refresh the access and save it to the preferences
  Future<String> refreshToken() async {
    try {
      final refreshToken = await _appPreferences.getRefreshToken();

      if (refreshToken.isBlank) {
        throw Exception('Refresh token is blank');
      }
      final data = await _datasource.refreshToken(refreshToken!);
      await _appPreferences.saveAccessToken(data.accessToken);

      return data.accessToken;
    } on Exception catch (e) {
      throw ApiException(
        kind: ApiExceptionKind.refreshTokenFailed,
        rootException: e,
      );
    }
  }
}
