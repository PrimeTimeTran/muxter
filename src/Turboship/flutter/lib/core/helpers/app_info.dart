import 'package:package_info_plus/package_info_plus.dart';
import 'package:turboship/all.dart';

enum AppFlavor { development, prod }

class AppInfo {
  static PackageInfo? _packageInfo;
  static late AppFlavor appFlavor;
  static String get applicationId => _packageInfo?.packageName ?? '';
  static String get appName => _packageInfo?.appName ?? '';
  static String get buildNumber => _packageInfo?.buildNumber ?? '';
  static String get versionName => _packageInfo?.version ?? '';
  AppInfo._();

  static Future<void> init() async {
    _getAppFlavor();
    _packageInfo = await PackageInfo.fromPlatform();
    LogUtil.i(applicationId, name: 'APPLICATION_ID');
    LogUtil.i(appName, name: 'APP_NAME');
    LogUtil.i(versionName, name: 'VERSION_NAME');
    LogUtil.i(buildNumber, name: 'BUILD_NUMBER');
  }

  static void _getAppFlavor() {
    const flavor =
        String.fromEnvironment('FLAVOR', defaultValue: 'development');

    if (flavor == 'development') {
      appFlavor = AppFlavor.development;
    } else if (flavor == 'prod') {
      appFlavor = AppFlavor.prod;
    } else {
      throw Exception('Unknown flavor');
    }

    LogUtil.i(name: 'Flavor', flavor);
  }
}

extension AppFlavorX on AppFlavor {
  bool get isDev => this == AppFlavor.development;
  bool get isProd => this == AppFlavor.prod;
}
