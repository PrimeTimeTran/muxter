import 'package:injectable/injectable.dart';
import 'package:turboship/all.dart';

@injectable
class ServerConfigMapper
    extends BaseDataMapper<ServerConfigData, ServerConfig> {
  @override
  ServerConfig mapToEntity(ServerConfigData data) {
    return ServerConfig(
      androidRequiredBuildNumber: int.parse(data.androidMinimumBuildNumber),
      iosRequiredBuildNumber: int.parse(data.iosMinimumBuildNumber),
      isMaintaining: data.isMaintaining,
    );
  }
}
