part of 'overlay_bloc.dart';

@freezed
class AppOverlayState with _$AppOverlayState {
  const factory AppOverlayState({
    AlertMessage? alertMessage,
    bool? loading,
  }) = _AppOverlayState;
}

@freezed
class AlertMessage with _$AlertMessage {
  const factory AlertMessage({
    required String message,
    required AlertType type,
    bool? loading,
  }) = _AlertMessage;
}
