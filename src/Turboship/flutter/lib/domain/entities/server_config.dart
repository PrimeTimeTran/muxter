import 'package:equatable/equatable.dart';

import '../../core/helpers/app_info.dart';
import '../../core/utils/platform_util.dart';

class ServerConfig extends Equatable {
  final int androidRequiredBuildNumber;
  final int iosRequiredBuildNumber;
  final bool isMaintaining;

  const ServerConfig({
    required this.androidRequiredBuildNumber,
    required this.iosRequiredBuildNumber,
    required this.isMaintaining,
  });

  bool get isForceUpdate {
    if (!PlatformUtil.isMobile) {
      return false;
    }

    final appBuildNumber = AppInfo.buildNumber;

    return PlatformUtil.isAndroid
        ? int.parse(appBuildNumber) < androidRequiredBuildNumber
        : int.parse(appBuildNumber) < iosRequiredBuildNumber;
  }

  @override
  List<Object?> get props => [
        androidRequiredBuildNumber,
        iosRequiredBuildNumber,
        isMaintaining,
      ];
}
