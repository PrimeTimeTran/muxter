import 'package:injectable/injectable.dart';

import 'di/raw_config.dart';

const _apiVersion = 'v1';

@singleton
class EnvConfig {
  final RawConfig _config;

  EnvConfig(this._config);

  String get baseUrl => _addApiVersion(_config['BASE_URL']!);

  String _addApiVersion(String url) => '$url/api/';
}
