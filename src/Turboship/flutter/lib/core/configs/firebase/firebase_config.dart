import 'package:firebase_core/firebase_core.dart';

import '../../utils/log_util.dart';
// import 'dev/firebase_options.dart' as dev;
// import 'prod/firebase_options.dart' as prod;

class FirebaseConfig {
  const FirebaseConfig._();

  static Future<void> config() async {
    // late String name;
    // late FirebaseOptions options;
    if (Firebase.apps.isEmpty) {
      const flavor =
          String.fromEnvironment('FLAVOR', defaultValue: 'development');

      if (flavor == 'development') {
        // options = dev.DefaultFirebaseOptions.currentPlatform;
      } else {
        // options = prod.DefaultFirebaseOptions.currentPlatform;
      }
      await Firebase.initializeApp(
        name: 'Turboship',
        // options: options,
      ).whenComplete(() {
        LogUtil.i(name: 'Firebase Setup', 'Done');
      });
    }
  }
}
