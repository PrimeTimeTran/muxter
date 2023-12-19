part of 'entity_bloc.dart';

abstract class EntityEvent extends BaseEvent {
  const EntityEvent();
}

@freezed
class EntityInit extends EntityEvent with _$EntityInit {
  const factory EntityInit() = _EntityInit;
}

@freezed
class FetchedEntitiesEvent extends EntityEvent with _$FetchedEntitiesEvent {
  const factory FetchedEntitiesEvent(List<Entity> entities) =
      _FetchedEntitiesEvent;
}
