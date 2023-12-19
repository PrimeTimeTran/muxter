// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overlay_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HideOverlayEvent {}

/// @nodoc
abstract class $HideOverlayEventCopyWith<$Res> {
  factory $HideOverlayEventCopyWith(
          HideOverlayEvent value, $Res Function(HideOverlayEvent) then) =
      _$HideOverlayEventCopyWithImpl<$Res, HideOverlayEvent>;
}

/// @nodoc
class _$HideOverlayEventCopyWithImpl<$Res, $Val extends HideOverlayEvent>
    implements $HideOverlayEventCopyWith<$Res> {
  _$HideOverlayEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HideOverlayEventImplCopyWith<$Res> {
  factory _$$HideOverlayEventImplCopyWith(_$HideOverlayEventImpl value,
          $Res Function(_$HideOverlayEventImpl) then) =
      __$$HideOverlayEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HideOverlayEventImplCopyWithImpl<$Res>
    extends _$HideOverlayEventCopyWithImpl<$Res, _$HideOverlayEventImpl>
    implements _$$HideOverlayEventImplCopyWith<$Res> {
  __$$HideOverlayEventImplCopyWithImpl(_$HideOverlayEventImpl _value,
      $Res Function(_$HideOverlayEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HideOverlayEventImpl implements _HideOverlayEvent {
  const _$HideOverlayEventImpl();

  @override
  String toString() {
    return 'HideOverlayEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HideOverlayEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _HideOverlayEvent implements HideOverlayEvent {
  const factory _HideOverlayEvent() = _$HideOverlayEventImpl;
}

/// @nodoc
mixin _$ShowLoadingEvent {}

/// @nodoc
abstract class $ShowLoadingEventCopyWith<$Res> {
  factory $ShowLoadingEventCopyWith(
          ShowLoadingEvent value, $Res Function(ShowLoadingEvent) then) =
      _$ShowLoadingEventCopyWithImpl<$Res, ShowLoadingEvent>;
}

/// @nodoc
class _$ShowLoadingEventCopyWithImpl<$Res, $Val extends ShowLoadingEvent>
    implements $ShowLoadingEventCopyWith<$Res> {
  _$ShowLoadingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShowLoadingEventImplCopyWith<$Res> {
  factory _$$ShowLoadingEventImplCopyWith(_$ShowLoadingEventImpl value,
          $Res Function(_$ShowLoadingEventImpl) then) =
      __$$ShowLoadingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowLoadingEventImplCopyWithImpl<$Res>
    extends _$ShowLoadingEventCopyWithImpl<$Res, _$ShowLoadingEventImpl>
    implements _$$ShowLoadingEventImplCopyWith<$Res> {
  __$$ShowLoadingEventImplCopyWithImpl(_$ShowLoadingEventImpl _value,
      $Res Function(_$ShowLoadingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowLoadingEventImpl implements _ShowLoadingEvent {
  const _$ShowLoadingEventImpl();

  @override
  String toString() {
    return 'ShowLoadingEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowLoadingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _ShowLoadingEvent implements ShowLoadingEvent {
  const factory _ShowLoadingEvent() = _$ShowLoadingEventImpl;
}

/// @nodoc
mixin _$ShowOverlayEvent {
  String get message => throw _privateConstructorUsedError;
  AlertType get alertType => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShowOverlayEventCopyWith<ShowOverlayEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowOverlayEventCopyWith<$Res> {
  factory $ShowOverlayEventCopyWith(
          ShowOverlayEvent value, $Res Function(ShowOverlayEvent) then) =
      _$ShowOverlayEventCopyWithImpl<$Res, ShowOverlayEvent>;
  @useResult
  $Res call({String message, AlertType alertType, Duration? duration});
}

/// @nodoc
class _$ShowOverlayEventCopyWithImpl<$Res, $Val extends ShowOverlayEvent>
    implements $ShowOverlayEventCopyWith<$Res> {
  _$ShowOverlayEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? alertType = null,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      alertType: null == alertType
          ? _value.alertType
          : alertType // ignore: cast_nullable_to_non_nullable
              as AlertType,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShowOverlayEventImplCopyWith<$Res>
    implements $ShowOverlayEventCopyWith<$Res> {
  factory _$$ShowOverlayEventImplCopyWith(_$ShowOverlayEventImpl value,
          $Res Function(_$ShowOverlayEventImpl) then) =
      __$$ShowOverlayEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, AlertType alertType, Duration? duration});
}

/// @nodoc
class __$$ShowOverlayEventImplCopyWithImpl<$Res>
    extends _$ShowOverlayEventCopyWithImpl<$Res, _$ShowOverlayEventImpl>
    implements _$$ShowOverlayEventImplCopyWith<$Res> {
  __$$ShowOverlayEventImplCopyWithImpl(_$ShowOverlayEventImpl _value,
      $Res Function(_$ShowOverlayEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? alertType = null,
    Object? duration = freezed,
  }) {
    return _then(_$ShowOverlayEventImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      alertType: null == alertType
          ? _value.alertType
          : alertType // ignore: cast_nullable_to_non_nullable
              as AlertType,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$ShowOverlayEventImpl implements _ShowOverlayEvent {
  const _$ShowOverlayEventImpl(this.message,
      {required this.alertType, this.duration});

  @override
  final String message;
  @override
  final AlertType alertType;
  @override
  final Duration? duration;

  @override
  String toString() {
    return 'ShowOverlayEvent(message: $message, alertType: $alertType, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowOverlayEventImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.alertType, alertType) ||
                other.alertType == alertType) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, alertType, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowOverlayEventImplCopyWith<_$ShowOverlayEventImpl> get copyWith =>
      __$$ShowOverlayEventImplCopyWithImpl<_$ShowOverlayEventImpl>(
          this, _$identity);
}

abstract class _ShowOverlayEvent implements ShowOverlayEvent {
  const factory _ShowOverlayEvent(final String message,
      {required final AlertType alertType,
      final Duration? duration}) = _$ShowOverlayEventImpl;

  @override
  String get message;
  @override
  AlertType get alertType;
  @override
  Duration? get duration;
  @override
  @JsonKey(ignore: true)
  _$$ShowOverlayEventImplCopyWith<_$ShowOverlayEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppOverlayState {
  AlertMessage? get alertMessage => throw _privateConstructorUsedError;
  bool? get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppOverlayStateCopyWith<AppOverlayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppOverlayStateCopyWith<$Res> {
  factory $AppOverlayStateCopyWith(
          AppOverlayState value, $Res Function(AppOverlayState) then) =
      _$AppOverlayStateCopyWithImpl<$Res, AppOverlayState>;
  @useResult
  $Res call({AlertMessage? alertMessage, bool? loading});

  $AlertMessageCopyWith<$Res>? get alertMessage;
}

/// @nodoc
class _$AppOverlayStateCopyWithImpl<$Res, $Val extends AppOverlayState>
    implements $AppOverlayStateCopyWith<$Res> {
  _$AppOverlayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertMessage = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      alertMessage: freezed == alertMessage
          ? _value.alertMessage
          : alertMessage // ignore: cast_nullable_to_non_nullable
              as AlertMessage?,
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AlertMessageCopyWith<$Res>? get alertMessage {
    if (_value.alertMessage == null) {
      return null;
    }

    return $AlertMessageCopyWith<$Res>(_value.alertMessage!, (value) {
      return _then(_value.copyWith(alertMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppOverlayStateImplCopyWith<$Res>
    implements $AppOverlayStateCopyWith<$Res> {
  factory _$$AppOverlayStateImplCopyWith(_$AppOverlayStateImpl value,
          $Res Function(_$AppOverlayStateImpl) then) =
      __$$AppOverlayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AlertMessage? alertMessage, bool? loading});

  @override
  $AlertMessageCopyWith<$Res>? get alertMessage;
}

/// @nodoc
class __$$AppOverlayStateImplCopyWithImpl<$Res>
    extends _$AppOverlayStateCopyWithImpl<$Res, _$AppOverlayStateImpl>
    implements _$$AppOverlayStateImplCopyWith<$Res> {
  __$$AppOverlayStateImplCopyWithImpl(
      _$AppOverlayStateImpl _value, $Res Function(_$AppOverlayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertMessage = freezed,
    Object? loading = freezed,
  }) {
    return _then(_$AppOverlayStateImpl(
      alertMessage: freezed == alertMessage
          ? _value.alertMessage
          : alertMessage // ignore: cast_nullable_to_non_nullable
              as AlertMessage?,
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$AppOverlayStateImpl implements _AppOverlayState {
  const _$AppOverlayStateImpl({this.alertMessage, this.loading});

  @override
  final AlertMessage? alertMessage;
  @override
  final bool? loading;

  @override
  String toString() {
    return 'AppOverlayState(alertMessage: $alertMessage, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppOverlayStateImpl &&
            (identical(other.alertMessage, alertMessage) ||
                other.alertMessage == alertMessage) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, alertMessage, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppOverlayStateImplCopyWith<_$AppOverlayStateImpl> get copyWith =>
      __$$AppOverlayStateImplCopyWithImpl<_$AppOverlayStateImpl>(
          this, _$identity);
}

abstract class _AppOverlayState implements AppOverlayState {
  const factory _AppOverlayState(
      {final AlertMessage? alertMessage,
      final bool? loading}) = _$AppOverlayStateImpl;

  @override
  AlertMessage? get alertMessage;
  @override
  bool? get loading;
  @override
  @JsonKey(ignore: true)
  _$$AppOverlayStateImplCopyWith<_$AppOverlayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AlertMessage {
  String get message => throw _privateConstructorUsedError;
  AlertType get type => throw _privateConstructorUsedError;
  bool? get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlertMessageCopyWith<AlertMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertMessageCopyWith<$Res> {
  factory $AlertMessageCopyWith(
          AlertMessage value, $Res Function(AlertMessage) then) =
      _$AlertMessageCopyWithImpl<$Res, AlertMessage>;
  @useResult
  $Res call({String message, AlertType type, bool? loading});
}

/// @nodoc
class _$AlertMessageCopyWithImpl<$Res, $Val extends AlertMessage>
    implements $AlertMessageCopyWith<$Res> {
  _$AlertMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertMessageImplCopyWith<$Res>
    implements $AlertMessageCopyWith<$Res> {
  factory _$$AlertMessageImplCopyWith(
          _$AlertMessageImpl value, $Res Function(_$AlertMessageImpl) then) =
      __$$AlertMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, AlertType type, bool? loading});
}

/// @nodoc
class __$$AlertMessageImplCopyWithImpl<$Res>
    extends _$AlertMessageCopyWithImpl<$Res, _$AlertMessageImpl>
    implements _$$AlertMessageImplCopyWith<$Res> {
  __$$AlertMessageImplCopyWithImpl(
      _$AlertMessageImpl _value, $Res Function(_$AlertMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? loading = freezed,
  }) {
    return _then(_$AlertMessageImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$AlertMessageImpl implements _AlertMessage {
  const _$AlertMessageImpl(
      {required this.message, required this.type, this.loading});

  @override
  final String message;
  @override
  final AlertType type;
  @override
  final bool? loading;

  @override
  String toString() {
    return 'AlertMessage(message: $message, type: $type, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertMessageImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, type, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertMessageImplCopyWith<_$AlertMessageImpl> get copyWith =>
      __$$AlertMessageImplCopyWithImpl<_$AlertMessageImpl>(this, _$identity);
}

abstract class _AlertMessage implements AlertMessage {
  const factory _AlertMessage(
      {required final String message,
      required final AlertType type,
      final bool? loading}) = _$AlertMessageImpl;

  @override
  String get message;
  @override
  AlertType get type;
  @override
  bool? get loading;
  @override
  @JsonKey(ignore: true)
  _$$AlertMessageImplCopyWith<_$AlertMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
