import '../entities/server_config.dart';

abstract interface class AuthRepository {
  Future<ServerConfig> getServerConfig();

  Future<void> signIn({
    required String email,
    required String password,
    bool keepSignedIn = false,
  });

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    String? referralCode,
  });
  Future<void> verifySignUp(String otp);
  Future<void> resendSignUpOtp(String email);

  Future<void> forgotPassword(String email);
  Future<void> verifyForgotPassword({
    required String email,
    required String newPassword,
    required String otp,
  });
  Future<void> resendForgotPasswordOtp(String email);

  Future<void> setNewPassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<void> logout();
}
