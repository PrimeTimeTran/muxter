// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_config_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerConfigDataImpl _$$ServerConfigDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerConfigDataImpl(
      androidMinimumBuildNumber: json['androidMinimumBuildNumber'] as String,
      iosMinimumBuildNumber: json['iosMinimumBuildNumber'] as String,
      isMaintaining: json['isMaintaining'] as bool,
    );

Map<String, dynamic> _$$ServerConfigDataImplToJson(
        _$ServerConfigDataImpl instance) =>
    <String, dynamic>{
      'androidMinimumBuildNumber': instance.androidMinimumBuildNumber,
      'iosMinimumBuildNumber': instance.iosMinimumBuildNumber,
      'isMaintaining': instance.isMaintaining,
    };
