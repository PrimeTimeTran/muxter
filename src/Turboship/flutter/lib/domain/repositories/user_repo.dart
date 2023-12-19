import '../entities/all.dart';

// Turbo: Domain repositories
// are responsible for defining the inputs/outputs that the domain required.
// What functionality do we require?

abstract interface class UserRepository {
  Future<User> getCurrentUser({bool forceRefreshToken = false});

  Future<User> updateUser(User user);
}
