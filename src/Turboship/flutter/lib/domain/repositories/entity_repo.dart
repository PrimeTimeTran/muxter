import '../entities/all.dart';

abstract interface class EntityRepository {
  Future<List<Entity>> getEntities();
  Future<Entity> updateEntity(Entity entity);
}
