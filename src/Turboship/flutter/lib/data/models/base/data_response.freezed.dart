// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataResponse<T> _$DataResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _DataResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$DataResponse<T> {
  T get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataResponseCopyWith<T, DataResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataResponseCopyWith<T, $Res> {
  factory $DataResponseCopyWith(
          DataResponse<T> value, $Res Function(DataResponse<T>) then) =
      _$DataResponseCopyWithImpl<T, $Res, DataResponse<T>>;
  @useResult
  $Res call({T data, String? message});
}

/// @nodoc
class _$DataResponseCopyWithImpl<T, $Res, $Val extends DataResponse<T>>
    implements $DataResponseCopyWith<T, $Res> {
  _$DataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataResponseImplCopyWith<T, $Res>
    implements $DataResponseCopyWith<T, $Res> {
  factory _$$DataResponseImplCopyWith(_$DataResponseImpl<T> value,
          $Res Function(_$DataResponseImpl<T>) then) =
      __$$DataResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data, String? message});
}

/// @nodoc
class __$$DataResponseImplCopyWithImpl<T, $Res>
    extends _$DataResponseCopyWithImpl<T, $Res, _$DataResponseImpl<T>>
    implements _$$DataResponseImplCopyWith<T, $Res> {
  __$$DataResponseImplCopyWithImpl(
      _$DataResponseImpl<T> _value, $Res Function(_$DataResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$DataResponseImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$DataResponseImpl<T> implements _DataResponse<T> {
  const _$DataResponseImpl({required this.data, this.message});

  factory _$DataResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$DataResponseImplFromJson(json, fromJsonT);

  @override
  final T data;
  @override
  final String? message;

  @override
  String toString() {
    return 'DataResponse<$T>(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataResponseImplCopyWith<T, _$DataResponseImpl<T>> get copyWith =>
      __$$DataResponseImplCopyWithImpl<T, _$DataResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$DataResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _DataResponse<T> implements DataResponse<T> {
  const factory _DataResponse({required final T data, final String? message}) =
      _$DataResponseImpl<T>;

  factory _DataResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$DataResponseImpl<T>.fromJson;

  @override
  T get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$DataResponseImplCopyWith<T, _$DataResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
