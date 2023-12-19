import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:turboship/all.dart';

// Turbo: Repository are a bridge between datasources & domain layer by providing a clean API to the domain layer to interact with the data. Local vs Remote
@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource _datasource;

  final UserMapper _userMapper;
  final AppPreferences _preferences;
  final RefreshTokenRepository _refreshTokenRepository;
  UserRepositoryImpl(
    this._datasource,
    this._userMapper,
    this._preferences,
    this._refreshTokenRepository,
  );

  @override
  Future<User> getCurrentUser({bool forceRefreshToken = false}) async {
    var accessToken = await _preferences.getAccessToken();

    if (forceRefreshToken) {
      accessToken = await _refreshTokenRepository.refreshToken();
    }

    final user =
        await _datasource.getCurrentUser().then(_userMapper.mapToEntity);

    final decodedToken = JwtDecoder.decode(accessToken!);

    return user.copyWith(
      isEmailVerified: decodedToken['is_email_verified'],
    );
  }

  @override
  Future<User> updateUser(User user) {
    final UserData userToUpdate = _userMapper.mapToData(user);

    return _datasource.updateUser(userToUpdate).then(_userMapper.mapToEntity);
  }
}
