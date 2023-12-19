// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseDataImpl _$$AuthResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseDataImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$AuthResponseDataImplToJson(
        _$AuthResponseDataImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
