part of 'app_bloc.dart';

@freezed
class AppState extends BaseState with _$AppState {
  const factory AppState({
    User? currentUser,
    String? lastUserId,
    @Default('Blue') palette,
    @Default(false) isForceUpdate,
    @Default(false) isMaintaining,
    @Default(false) bool isDarkTheme,
    @Default(LocaleConfig.defaultLocale) String locale,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  const AppState._();

  bool get isLoggedIn => currentUser != null;
}
