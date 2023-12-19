// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_config_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerConfigData _$ServerConfigDataFromJson(Map<String, dynamic> json) {
  return _ServerConfigData.fromJson(json);
}

/// @nodoc
mixin _$ServerConfigData {
  String get androidMinimumBuildNumber => throw _privateConstructorUsedError;
  String get iosMinimumBuildNumber => throw _privateConstructorUsedError;
  bool get isMaintaining => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerConfigDataCopyWith<ServerConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerConfigDataCopyWith<$Res> {
  factory $ServerConfigDataCopyWith(
          ServerConfigData value, $Res Function(ServerConfigData) then) =
      _$ServerConfigDataCopyWithImpl<$Res, ServerConfigData>;
  @useResult
  $Res call(
      {String androidMinimumBuildNumber,
      String iosMinimumBuildNumber,
      bool isMaintaining});
}

/// @nodoc
class _$ServerConfigDataCopyWithImpl<$Res, $Val extends ServerConfigData>
    implements $ServerConfigDataCopyWith<$Res> {
  _$ServerConfigDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidMinimumBuildNumber = null,
    Object? iosMinimumBuildNumber = null,
    Object? isMaintaining = null,
  }) {
    return _then(_value.copyWith(
      androidMinimumBuildNumber: null == androidMinimumBuildNumber
          ? _value.androidMinimumBuildNumber
          : androidMinimumBuildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      iosMinimumBuildNumber: null == iosMinimumBuildNumber
          ? _value.iosMinimumBuildNumber
          : iosMinimumBuildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isMaintaining: null == isMaintaining
          ? _value.isMaintaining
          : isMaintaining // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerConfigDataImplCopyWith<$Res>
    implements $ServerConfigDataCopyWith<$Res> {
  factory _$$ServerConfigDataImplCopyWith(_$ServerConfigDataImpl value,
          $Res Function(_$ServerConfigDataImpl) then) =
      __$$ServerConfigDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String androidMinimumBuildNumber,
      String iosMinimumBuildNumber,
      bool isMaintaining});
}

/// @nodoc
class __$$ServerConfigDataImplCopyWithImpl<$Res>
    extends _$ServerConfigDataCopyWithImpl<$Res, _$ServerConfigDataImpl>
    implements _$$ServerConfigDataImplCopyWith<$Res> {
  __$$ServerConfigDataImplCopyWithImpl(_$ServerConfigDataImpl _value,
      $Res Function(_$ServerConfigDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidMinimumBuildNumber = null,
    Object? iosMinimumBuildNumber = null,
    Object? isMaintaining = null,
  }) {
    return _then(_$ServerConfigDataImpl(
      androidMinimumBuildNumber: null == androidMinimumBuildNumber
          ? _value.androidMinimumBuildNumber
          : androidMinimumBuildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      iosMinimumBuildNumber: null == iosMinimumBuildNumber
          ? _value.iosMinimumBuildNumber
          : iosMinimumBuildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isMaintaining: null == isMaintaining
          ? _value.isMaintaining
          : isMaintaining // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerConfigDataImpl implements _ServerConfigData {
  const _$ServerConfigDataImpl(
      {required this.androidMinimumBuildNumber,
      required this.iosMinimumBuildNumber,
      required this.isMaintaining});

  factory _$ServerConfigDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerConfigDataImplFromJson(json);

  @override
  final String androidMinimumBuildNumber;
  @override
  final String iosMinimumBuildNumber;
  @override
  final bool isMaintaining;

  @override
  String toString() {
    return 'ServerConfigData(androidMinimumBuildNumber: $androidMinimumBuildNumber, iosMinimumBuildNumber: $iosMinimumBuildNumber, isMaintaining: $isMaintaining)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerConfigDataImpl &&
            (identical(other.androidMinimumBuildNumber,
                    androidMinimumBuildNumber) ||
                other.androidMinimumBuildNumber == androidMinimumBuildNumber) &&
            (identical(other.iosMinimumBuildNumber, iosMinimumBuildNumber) ||
                other.iosMinimumBuildNumber == iosMinimumBuildNumber) &&
            (identical(other.isMaintaining, isMaintaining) ||
                other.isMaintaining == isMaintaining));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, androidMinimumBuildNumber,
      iosMinimumBuildNumber, isMaintaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerConfigDataImplCopyWith<_$ServerConfigDataImpl> get copyWith =>
      __$$ServerConfigDataImplCopyWithImpl<_$ServerConfigDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerConfigDataImplToJson(
      this,
    );
  }
}

abstract class _ServerConfigData implements ServerConfigData {
  const factory _ServerConfigData(
      {required final String androidMinimumBuildNumber,
      required final String iosMinimumBuildNumber,
      required final bool isMaintaining}) = _$ServerConfigDataImpl;

  factory _ServerConfigData.fromJson(Map<String, dynamic> json) =
      _$ServerConfigDataImpl.fromJson;

  @override
  String get androidMinimumBuildNumber;
  @override
  String get iosMinimumBuildNumber;
  @override
  bool get isMaintaining;
  @override
  @JsonKey(ignore: true)
  _$$ServerConfigDataImplCopyWith<_$ServerConfigDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
