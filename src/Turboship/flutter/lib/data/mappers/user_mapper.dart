import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

@injectable
class UserMapper extends BaseDataMapper<UserData, User> with DataMapperMixin {
  @override
  UserData mapToData(User entity) {
    return UserData(
      id: entity.id.trim(),
      fullName: entity.fullName,
      email: entity.email,
      dateOfBirth: entity.dateOfBirth,
      gender: _GenderMapper().mapToData(entity.gender),
    );
  }

  @override
  User mapToEntity(UserData data) {
    return User(
      id: data.id.trim(),
      fullName: data.fullName,
      email: data.email,
      dateOfBirth: data.dateOfBirth,
      gender: _GenderMapper().mapToEntity(data.gender),
      referralCode: data.referralCode,
    );
  }
}

class _GenderMapper extends BaseDataMapper<String?, Gender?>
    with DataMapperMixin {
  @override
  String? mapToData(Gender? entity) {
    switch (entity) {
      case Gender.male:
        return ServerRequestResponseConstants.male;
      case Gender.female:
        return ServerRequestResponseConstants.female;
      case Gender.other:
        return ServerRequestResponseConstants.nondisclosure;
      default:
        return null;
    }
  }

  @override
  Gender? mapToEntity(String? data) {
    switch (data) {
      case ServerRequestResponseConstants.male:
        return Gender.male;
      case ServerRequestResponseConstants.female:
        return Gender.female;
      case ServerRequestResponseConstants.nonbinary:
      case ServerRequestResponseConstants.nondisclosure:
        return Gender.female;
      default:
        return null;
    }
  }
}
