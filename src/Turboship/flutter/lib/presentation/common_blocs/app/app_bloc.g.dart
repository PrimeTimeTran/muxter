// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      currentUser: json['currentUser'] == null
          ? null
          : User.fromJson(json['currentUser'] as Map<String, dynamic>),
      lastUserId: json['lastUserId'] as String?,
      palette: json['palette'] ?? 'Blue',
      isForceUpdate: json['isForceUpdate'] ?? false,
      isMaintaining: json['isMaintaining'] ?? false,
      isDarkTheme: json['isDarkTheme'] as bool? ?? false,
      locale: json['locale'] as String? ?? LocaleConfig.defaultLocale,
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'currentUser': instance.currentUser,
      'lastUserId': instance.lastUserId,
      'palette': instance.palette,
      'isForceUpdate': instance.isForceUpdate,
      'isMaintaining': instance.isMaintaining,
      'isDarkTheme': instance.isDarkTheme,
      'locale': instance.locale,
    };
