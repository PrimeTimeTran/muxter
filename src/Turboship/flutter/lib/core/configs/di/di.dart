import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

import 'di.config.dart';
import 'raw_config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  @singleton
  Future<AppPreferences> get appPreferences async =>
      AppPreferences().getInstance();

  @singleton
  @preResolve
  Future<RawConfig> configEnv() async {
    final flavor = AppInfo.appFlavor.name;

    LogUtil.i(name: 'Flavor', flavor);

    // flutter run --dart-define=FLAVOR=development
    // flutter run --flavor development --target lib/main_development.dart
    await dotenv.load(fileName: 'assets/env/.env.$flavor');

    LogUtil.i(name: 'ENV', LogUtil.prettyJson(dotenv.env));

    return RawConfig.from(dotenv.env);
  }
}
