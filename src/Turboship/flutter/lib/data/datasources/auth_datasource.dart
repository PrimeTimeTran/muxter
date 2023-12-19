import 'package:injectable/injectable.dart';

import '../mappers/response_mapper/base/base.dart';
import '../models/all.dart';
import 'providers/api/api.dart';

const _prefix = '/authentication';

abstract interface class AuthDatasource {
  // forgot password
  Future<void> forgotPassword(String email);

  // Get app config
  Future<ServerConfigData> getServerConfig();
  Future<void> resendForgotPasswordOtp(String email);
  Future<void> resendSignupOtp(String email);

  Future<void> setNewPassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<AuthResponseData> signIn(String email, String password);
  // sign up
  Future<AuthResponseData> signup({
    required String fullName,
    required String email,
    required String password,
    String? referralCode,
  });
  Future<void> verifyForgotPassword({
    required String otp,
    required String email,
    required String newPassword,
  });

  Future<void> verifySignup(String otp);
}

@Injectable(as: AuthDatasource)
class AuthDataSourceImpl implements AuthDatasource {
  final NoneAuthenticatedRestApiClient _noneAuthClient;

  final AuthenticatedRestApiClient _authClient;
  AuthDataSourceImpl(
    this._noneAuthClient,
    this._authClient,
  );

  @override
  Future<void> forgotPassword(String email) async {
    return _noneAuthClient.post(
      '$_prefix/otp/forgot-password/verification',
      body: {'email': email},
      successResponseMapperType: SuccessResponseMapperType.plain,
    );
  }

  @override
  Future<ServerConfigData> getServerConfig() {
    return _noneAuthClient
        .get(
          '$_prefix/app',
          decoder: (json) =>
              ServerConfigData.fromJson(json as Map<String, dynamic>),
        )
        .then((response) => response.data);
  }

  @override
  Future<void> resendForgotPasswordOtp(String email) async {
    final body = {
      'email': email,
      'kind': ResendOtpType.forgotPassword.value,
    };

    return _noneAuthClient.post(
      '$_prefix/otp/resend',
      body: body,
      successResponseMapperType: SuccessResponseMapperType.plain,
    );
  }

  @override
  Future<void> resendSignupOtp(String email) async {
    final body = {
      'email': email,
      'kind': ResendOtpType.signUp.value,
    };

    return _authClient.post(
      '$_prefix/otp/resend',
      body: body,
      successResponseMapperType: SuccessResponseMapperType.plain,
    );
  }

  @override
  Future<void> setNewPassword({
    required String currentPassword,
    required String newPassword,
  }) {
    final body = {
      'current_password': currentPassword,
      'new_password': newPassword,
    };

    return _authClient.patch(
      '$_prefix/password',
      body: body,
      successResponseMapperType: SuccessResponseMapperType.plain,
    );
  }

  @override
  Future<AuthResponseData> signIn(String email, String password) {
    final body = {
      'email': email,
      'password': password,
    };

    return _noneAuthClient
        .post(
          '$_prefix/login',
          body: body,
          decoder: (json) =>
              AuthResponseData.fromJson(json as Map<String, dynamic>),
        )
        .then((response) => response.data);
  }

  @override
  Future<AuthResponseData> signup({
    required String fullName,
    required String email,
    required String password,
    String? referralCode,
  }) {
    final body = {
      'full_name': fullName,
      'email': email,
      'password': password,
      'referred_by_code': referralCode,
    };

    return _noneAuthClient
        .post(
          '$_prefix/register',
          body: body,
          decoder: (json) =>
              AuthResponseData.fromJson(json as Map<String, dynamic>),
        )
        .then((response) => response.data);
  }

  @override
  Future<void> verifyForgotPassword({
    required String otp,
    required String email,
    required String newPassword,
  }) async {
    final body = {
      'otp': otp,
      'email': email,
      'new_password': newPassword,
    };

    await _noneAuthClient.post(
      '$_prefix/otp/forgot-password/confirmation',
      body: body,
      successResponseMapperType: SuccessResponseMapperType.plain,
    );
  }

  @override
  Future<void> verifySignup(String otp) async {
    return _authClient.post(
      '$_prefix/otp/registration/confirmation',
      body: {'otp': otp},
      successResponseMapperType: SuccessResponseMapperType.plain,
    );
  }
}

enum ResendOtpType {
  signUp('user_registration'),
  forgotPassword('forgot_password');

  final String value;
  const ResendOtpType(this.value);
}
