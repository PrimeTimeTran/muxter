import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_config_data.freezed.dart';
part 'server_config_data.g.dart';

@freezed
class ServerConfigData with _$ServerConfigData {
  const factory ServerConfigData({
    required String androidMinimumBuildNumber,
    required String iosMinimumBuildNumber,
    required bool isMaintaining,
  }) = _ServerConfigData;

  factory ServerConfigData.fromJson(Map<String, dynamic> json) => _$ServerConfigDataFromJson(json);
}
