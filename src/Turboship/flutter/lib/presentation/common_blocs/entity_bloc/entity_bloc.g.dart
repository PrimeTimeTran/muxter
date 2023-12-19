// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntityStateImpl _$$EntityStateImplFromJson(Map<String, dynamic> json) =>
    _$EntityStateImpl(
      entities: (json['entities'] as List<dynamic>?)
              ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$EntityStateImplToJson(_$EntityStateImpl instance) =>
    <String, dynamic>{
      'entities': instance.entities,
    };
