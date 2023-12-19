import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

class GetCurrentUserParams extends BaseUsecaseParams {
  final bool forceRefreshToken;

  const GetCurrentUserParams({this.forceRefreshToken = false});
}

@injectable
class GetCurrentUserUseCase
    extends BaseFutureUseCase<GetCurrentUserParams, User> {
  final UserRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  Future<User> buildUseCase(GetCurrentUserParams params) async {
    return _repository.getCurrentUser(
      forceRefreshToken: params.forceRefreshToken,
    );
  }
}
