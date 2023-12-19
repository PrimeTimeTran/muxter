part of 'entity_bloc.dart';

@freezed
class EntityState extends BaseState with _$EntityState {
  const factory EntityState({@Default([]) List<Entity>? entities}) =
      _EntityState;

  factory EntityState.fromJson(Map<String, dynamic> json) =>
      _$EntityStateFromJson(json);

  const EntityState._();
}
