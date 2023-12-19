// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EntityInit {}

/// @nodoc
abstract class $EntityInitCopyWith<$Res> {
  factory $EntityInitCopyWith(
          EntityInit value, $Res Function(EntityInit) then) =
      _$EntityInitCopyWithImpl<$Res, EntityInit>;
}

/// @nodoc
class _$EntityInitCopyWithImpl<$Res, $Val extends EntityInit>
    implements $EntityInitCopyWith<$Res> {
  _$EntityInitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EntityInitImplCopyWith<$Res> {
  factory _$$EntityInitImplCopyWith(
          _$EntityInitImpl value, $Res Function(_$EntityInitImpl) then) =
      __$$EntityInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EntityInitImplCopyWithImpl<$Res>
    extends _$EntityInitCopyWithImpl<$Res, _$EntityInitImpl>
    implements _$$EntityInitImplCopyWith<$Res> {
  __$$EntityInitImplCopyWithImpl(
      _$EntityInitImpl _value, $Res Function(_$EntityInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EntityInitImpl implements _EntityInit {
  const _$EntityInitImpl();

  @override
  String toString() {
    return 'EntityInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EntityInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _EntityInit implements EntityInit {
  const factory _EntityInit() = _$EntityInitImpl;
}

/// @nodoc
mixin _$FetchedEntitiesEvent {
  List<Entity> get entities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchedEntitiesEventCopyWith<FetchedEntitiesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchedEntitiesEventCopyWith<$Res> {
  factory $FetchedEntitiesEventCopyWith(FetchedEntitiesEvent value,
          $Res Function(FetchedEntitiesEvent) then) =
      _$FetchedEntitiesEventCopyWithImpl<$Res, FetchedEntitiesEvent>;
  @useResult
  $Res call({List<Entity> entities});
}

/// @nodoc
class _$FetchedEntitiesEventCopyWithImpl<$Res,
        $Val extends FetchedEntitiesEvent>
    implements $FetchedEntitiesEventCopyWith<$Res> {
  _$FetchedEntitiesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_value.copyWith(
      entities: null == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<Entity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchedEntitiesEventImplCopyWith<$Res>
    implements $FetchedEntitiesEventCopyWith<$Res> {
  factory _$$FetchedEntitiesEventImplCopyWith(_$FetchedEntitiesEventImpl value,
          $Res Function(_$FetchedEntitiesEventImpl) then) =
      __$$FetchedEntitiesEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Entity> entities});
}

/// @nodoc
class __$$FetchedEntitiesEventImplCopyWithImpl<$Res>
    extends _$FetchedEntitiesEventCopyWithImpl<$Res, _$FetchedEntitiesEventImpl>
    implements _$$FetchedEntitiesEventImplCopyWith<$Res> {
  __$$FetchedEntitiesEventImplCopyWithImpl(_$FetchedEntitiesEventImpl _value,
      $Res Function(_$FetchedEntitiesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = null,
  }) {
    return _then(_$FetchedEntitiesEventImpl(
      null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<Entity>,
    ));
  }
}

/// @nodoc

class _$FetchedEntitiesEventImpl implements _FetchedEntitiesEvent {
  const _$FetchedEntitiesEventImpl(final List<Entity> entities)
      : _entities = entities;

  final List<Entity> _entities;
  @override
  List<Entity> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'FetchedEntitiesEvent(entities: $entities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedEntitiesEventImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchedEntitiesEventImplCopyWith<_$FetchedEntitiesEventImpl>
      get copyWith =>
          __$$FetchedEntitiesEventImplCopyWithImpl<_$FetchedEntitiesEventImpl>(
              this, _$identity);
}

abstract class _FetchedEntitiesEvent implements FetchedEntitiesEvent {
  const factory _FetchedEntitiesEvent(final List<Entity> entities) =
      _$FetchedEntitiesEventImpl;

  @override
  List<Entity> get entities;
  @override
  @JsonKey(ignore: true)
  _$$FetchedEntitiesEventImplCopyWith<_$FetchedEntitiesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EntityState _$EntityStateFromJson(Map<String, dynamic> json) {
  return _EntityState.fromJson(json);
}

/// @nodoc
mixin _$EntityState {
  List<Entity>? get entities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityStateCopyWith<EntityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityStateCopyWith<$Res> {
  factory $EntityStateCopyWith(
          EntityState value, $Res Function(EntityState) then) =
      _$EntityStateCopyWithImpl<$Res, EntityState>;
  @useResult
  $Res call({List<Entity>? entities});
}

/// @nodoc
class _$EntityStateCopyWithImpl<$Res, $Val extends EntityState>
    implements $EntityStateCopyWith<$Res> {
  _$EntityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = freezed,
  }) {
    return _then(_value.copyWith(
      entities: freezed == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntityStateImplCopyWith<$Res>
    implements $EntityStateCopyWith<$Res> {
  factory _$$EntityStateImplCopyWith(
          _$EntityStateImpl value, $Res Function(_$EntityStateImpl) then) =
      __$$EntityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Entity>? entities});
}

/// @nodoc
class __$$EntityStateImplCopyWithImpl<$Res>
    extends _$EntityStateCopyWithImpl<$Res, _$EntityStateImpl>
    implements _$$EntityStateImplCopyWith<$Res> {
  __$$EntityStateImplCopyWithImpl(
      _$EntityStateImpl _value, $Res Function(_$EntityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entities = freezed,
  }) {
    return _then(_$EntityStateImpl(
      entities: freezed == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<Entity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntityStateImpl extends _EntityState {
  const _$EntityStateImpl({final List<Entity>? entities = const []})
      : _entities = entities,
        super._();

  factory _$EntityStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntityStateImplFromJson(json);

  final List<Entity>? _entities;
  @override
  @JsonKey()
  List<Entity>? get entities {
    final value = _entities;
    if (value == null) return null;
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EntityState(entities: $entities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityStateImpl &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityStateImplCopyWith<_$EntityStateImpl> get copyWith =>
      __$$EntityStateImplCopyWithImpl<_$EntityStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntityStateImplToJson(
      this,
    );
  }
}

abstract class _EntityState extends EntityState {
  const factory _EntityState({final List<Entity>? entities}) =
      _$EntityStateImpl;
  const _EntityState._() : super._();

  factory _EntityState.fromJson(Map<String, dynamic> json) =
      _$EntityStateImpl.fromJson;

  @override
  List<Entity>? get entities;
  @override
  @JsonKey(ignore: true)
  _$$EntityStateImplCopyWith<_$EntityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
