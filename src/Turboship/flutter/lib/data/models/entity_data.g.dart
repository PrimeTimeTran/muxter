// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntityDataImpl _$$EntityDataImplFromJson(Map<String, dynamic> json) =>
    _$EntityDataImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      email: json['email'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      jobTitle: json['jobTitle'] as String?,
      industry: json['industry'] as String?,
      house: json['house'] as String?,
      patronus: json['patronus'] as String?,
      dob: json['dob'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$EntityDataImplToJson(_$EntityDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'email': instance.email,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'city': instance.city,
      'country': instance.country,
      'jobTitle': instance.jobTitle,
      'industry': instance.industry,
      'house': instance.house,
      'patronus': instance.patronus,
      'dob': instance.dob,
      'avatarUrl': instance.avatarUrl,
    };
