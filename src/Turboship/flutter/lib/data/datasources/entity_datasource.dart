import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';
import 'package:turboship/data/models/entity_data.dart';

abstract interface class EntityDataSource {
  Future<List<EntityData>> getEntities();

  Future<EntityData> updateEntity(EntityData entityToUpdate);
}

@LazySingleton(as: EntityDataSource)
class EntityDataSourceImpl implements EntityDataSource {
  final AuthenticatedRestApiClient _client;

  // [ ] CRUD:
  // [ ] C
  // [x] R success
  // [ ] U
  // [ ] D

  EntityDataSourceImpl(this._client);
  @override
  Future<List<EntityData>> getEntities() {
    return _client.get(
      '/wizards',
      decoder: (json) {
        return EntityData.listFromJson(json as List<dynamic>);
      },
    ).then((response) => response.data);
  }

  @override
  Future<EntityData> updateEntity(EntityData entityToUpdate) {
    final body = {
      // 'full_name': entityToUpdate.firstName,
    };

    return _client
        .patch(
          '/user',
          body: body,
          decoder: (json) => EntityData.fromJson(json as Map<String, dynamic>),
        )
        .then((response) => response.data);
  }
}
