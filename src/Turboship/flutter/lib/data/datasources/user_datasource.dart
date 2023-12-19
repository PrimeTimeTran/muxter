import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

// Data sources are responsible for handling all the operations]
// related to data retrieval & manipulation
abstract interface class UserDataSource {
  Future<UserData> getCurrentUser();

  Future<UserData> updateUser(UserData userToUpdate);
}

@LazySingleton(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  final AuthenticatedRestApiClient _client;

  UserDataSourceImpl(this._client);

  @override
  Future<UserData> getCurrentUser() {
    return _client
        .get(
          '/user',
          decoder: (json) => UserData.fromJson(json as Map<String, dynamic>),
        )
        .then((response) => response.data);
  }

  @override
  Future<UserData> updateUser(UserData userToUpdate) {
    final body = {
      'full_name': userToUpdate.fullName,
      'date_of_birth': userToUpdate.dateOfBirth?.toIso8601String(),
      'gender': userToUpdate.gender,
    };

    return _client
        .patch(
          '/user',
          body: body,
          decoder: (json) => UserData.fromJson(json as Map<String, dynamic>),
        )
        .then((response) => response.data);
  }
}
