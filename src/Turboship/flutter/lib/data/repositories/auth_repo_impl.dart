import 'package:injectable/injectable.dart';

import '../../core/exceptions/all.dart';
import '../../domain/all.dart';
import '../datasources/all.dart';
import '../mappers/all.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AppPreferences _appPreferences;

  final AuthDatasource _datasource;
  final ServerConfigMapper _serverConfigMapper;
  AuthRepositoryImpl(
    this._appPreferences,
    this._datasource,
    this._serverConfigMapper,
  );

  @override
  Future<void> forgotPassword(String email) {
    return _datasource.forgotPassword(email);
  }

  @override
  Future<ServerConfig> getServerConfig() {
    return _datasource.getServerConfig().then(_serverConfigMapper.mapToEntity);
  }

  @override
  Future<void> logout() async {
    await _appPreferences.deleteAllTokens();
  }

  @override
  Future<void> resendForgotPasswordOtp(String email) {
    return _datasource.resendForgotPasswordOtp(email);
  }

  @override
  Future<void> resendSignUpOtp(String email) {
    return _datasource.resendSignupOtp(email);
  }

  @override
  Future<void> setNewPassword({
    required String currentPassword,
    required String newPassword,
  }) {
    return _datasource.setNewPassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
    bool keepSignedIn = false,
    String? otp,
  }) async {
    try {
      final authResponseData = await _datasource.signIn(email, password);

      await _appPreferences.saveAccessToken(authResponseData.accessToken);
      if (keepSignedIn) {
        await _appPreferences.saveRefreshToken(authResponseData.refreshToken);
      }
    } on ApiException catch (e) {
      if (e.kind == ApiExceptionKind.serverDefined && e.statusCode == 400) {
        if (e.serverError!.message!.contains('invalid')) {
          throw const AuthException(AuthExceptionKind.invalidCredentials);
        }
      }

      rethrow;
    }
  }

  @override
  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    try {
      final authResponseData = await _datasource.signup(
        fullName: fullName,
        email: email,
        password: password,
        referralCode: referralCode,
      );

      await _appPreferences.saveAccessToken(authResponseData.accessToken);
      await _appPreferences.saveRefreshToken(authResponseData.refreshToken);
    } on ApiException catch (e) {
      if (e.kind == ApiExceptionKind.serverDefined && e.statusCode == 400) {
        if (e.serverError!.message!.contains('exists')) {
          throw const AuthException(AuthExceptionKind.emailAlreadyInUse);
        }
      }

      rethrow;
    }
  }

  @override
  Future<void> verifyForgotPassword(
      {required String otp,
      required String email,
      required String newPassword}) {
    return _datasource.verifyForgotPassword(
        otp: otp, email: email, newPassword: newPassword);
  }

  @override
  Future<void> verifySignUp(String otp) {
    return _datasource.verifySignup(otp);
  }
}
