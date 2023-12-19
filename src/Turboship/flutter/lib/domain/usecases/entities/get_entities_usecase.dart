import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

class GetEntitiesParams extends BaseUsecaseParams {
  const GetEntitiesParams();
}

@injectable
class GetEntitiesUseCase extends BaseFutureListUseCase<NoParams, Entity> {
  final EntityRepository _repository;

  GetEntitiesUseCase(this._repository);

  @override
  Future<List<Entity>> buildUseCase(NoParams params) async {
    return await _repository.getEntities();
  }
}
