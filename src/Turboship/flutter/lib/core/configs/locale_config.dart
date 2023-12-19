import 'dart:ui';

class LocaleConfig {
  static final supportedLocales =
      _supportedLocalesCode.map((e) => Locale(e)).toList();

  static const _supportedLocalesCode = ['vi', 'en'];
  static const String defaultLocale = 'vi';

  LocaleConfig._();
}
