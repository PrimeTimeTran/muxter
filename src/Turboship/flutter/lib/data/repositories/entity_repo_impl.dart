import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';
import 'package:turboship/data/datasources/entity_datasource.dart';
import 'package:turboship/data/models/entity_data.dart';

@LazySingleton(as: EntityRepository)
class EntityRepositoryImpl implements EntityRepository {
  final EntityDataSource _datasource;

  final EntityMapper _entityMapper;
  final AppPreferences _preferences;
  final RefreshTokenRepository _refreshTokenRepository;
  EntityRepositoryImpl(
    this._datasource,
    this._entityMapper,
    this._preferences,
    this._refreshTokenRepository,
  );

  @override
  Future<List<Entity>> getEntities({bool forceRefreshToken = false}) async {
    final List<EntityData> entityDataList = await _datasource.getEntities();
    final List<Entity> entities = _entityMapper.mapToEntities(entityDataList);

    return entities;
  }

  @override
  Future<Entity> updateEntity(Entity entity) {
    final EntityData entityToUpdate = _entityMapper.mapToData(entity);

    return _datasource
        .updateEntity(entityToUpdate)
        .then(_entityMapper.mapToEntity);
  }
}
