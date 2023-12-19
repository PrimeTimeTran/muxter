import 'package:injectable/injectable.dart';

import '../../entities/user.dart';
import '../../repositories/user_repo.dart';
import '../base/base_params.dart';
import '../base/base_usecases.dart';

@injectable
class UpdateUserUseCase extends BaseFutureUseCase<UpdateUserParams, User> {
  UpdateUserUseCase(this._repository);

  final UserRepository _repository;

  @override
  Future<User> buildUseCase(UpdateUserParams params) async {
    return _repository.updateUser(params.user);
  }
}

class UpdateUserParams extends BaseUsecaseParams {
  UpdateUserParams(this.user);

  final User user;
}
