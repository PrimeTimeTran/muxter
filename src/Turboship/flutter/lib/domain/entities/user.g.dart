// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      referralCode: json['referralCode'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      hasSignedContract: json['hasSignedContract'] as bool? ?? false,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': _$GenderEnumMap[instance.gender],
      'referralCode': instance.referralCode,
      'isEmailVerified': instance.isEmailVerified,
      'hasSignedContract': instance.hasSignedContract,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};
