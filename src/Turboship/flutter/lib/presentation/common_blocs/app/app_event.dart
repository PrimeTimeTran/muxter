part of 'app_bloc.dart';

abstract class AppEvent extends BaseEvent {
  const AppEvent();
}

@freezed
class AppInitiated extends AppEvent with _$AppInitiated {
  const factory AppInitiated() = _AppInitiated;
}

@freezed
class AppLanguageChanged extends AppEvent with _$AppLanguageChanged {
  const factory AppLanguageChanged(String locale) = _AppLanguageChanged;
}

@freezed
class AppPaletteChanged extends AppEvent with _$AppPaletteChanged {
  const factory AppPaletteChanged(String name) = _AppPaletteChanged;
}

@freezed
class AppResumed extends AppEvent with _$AppResumed {
  const factory AppResumed() = _AppResumed;
}

@freezed
class AppThemeChanged extends AppEvent with _$AppThemeChanged {
  const factory AppThemeChanged(bool isDarkTheme) = _AppThemeChanged;
}

@freezed
class GetAppServerConfig extends AppEvent with _$GetAppServerConfig {
  const factory GetAppServerConfig() = _GetAppServerConfig;
}

@freezed
class GetCurrentUser extends AppEvent with _$GetCurrentUser {
  const factory GetCurrentUser({
    FutureOr<void> Function(User user)? onSuccess,
    FutureOr<void> Function(Object error)? onError,
    @Default(false) bool checkContractStatus,
    Completer<void>? completer,
    @Default(false) bool forceRefreshToken,
  }) = _GetCurrentUser;
}

@freezed
class GetEntities extends AppEvent with _$GetEntities {
  const factory GetEntities({
    FutureOr<void> Function(List<Entity> entities)? onSuccess,
    FutureOr<void> Function(Object error)? onError,
    @Default(false) bool checkContractStatus,
    Completer<void>? completer,
    @Default(false) bool forceRefreshToken,
  }) = _GetEntities;
}

@freezed
class GetUserSignContractStatus extends AppEvent
    with _$GetUserSignContractStatus {
  const factory GetUserSignContractStatus() = _GetUserSignContractStatus;
}

@freezed
class LoggedUserChanged extends AppEvent with _$LoggedUserChanged {
  const factory LoggedUserChanged(User? user, {bool? hasSignedContract}) =
      _LoggedUserChanged;
}
