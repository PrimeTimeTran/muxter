// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseInfo _$BaseInfoFromJson(Map<String, dynamic> json) => BaseInfo(
      rate: (json['rate'] as num).toDouble(),
      plSum: (json['plSum'] as num).toDouble(),
      totalSum: (json['totalSum'] as num).toDouble(),
      plPercent: (json['plPercent'] as num).toDouble(),
      transfersSum: (json['transfersSum'] as num).toDouble(),
    );

Map<String, dynamic> _$BaseInfoToJson(BaseInfo instance) => <String, dynamic>{
      'rate': instance.rate,
      'plSum': instance.plSum,
      'plPercent': instance.plPercent,
      'totalSum': instance.totalSum,
      'transfersSum': instance.transfersSum,
    };

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) => UserAccount(
      plSum: (json['plSum'] as num).toDouble(),
      plPercent: (json['plPercent'] as num).toDouble(),
      totalSum: (json['totalSum'] as num).toDouble(),
      transfersSum: (json['transfersSum'] as num).toDouble(),
      safe: BaseInfo.fromJson(json['safe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'plSum': instance.plSum,
      'plPercent': instance.plPercent,
      'totalSum': instance.totalSum,
      'transfersSum': instance.transfersSum,
      'safe': instance.safe,
    };
