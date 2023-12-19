import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:turboship/all.dart';
// import 'firebase/firebase_config.dart';

Future<void> configureApp() async {
  await AppInfo.init();
  await Hive.initFlutter();
  // await FirebaseConfig.config();
  await configureInjection();
  await _configureBloc();
}

Future<void> _configureBloc() async {
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
}
