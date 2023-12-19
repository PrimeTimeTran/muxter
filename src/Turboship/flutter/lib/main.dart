// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:turboship/all.dart';

Future<void> main() async {
  runZonedGuarded(_runMyApp, _reportError);
}

// void main() => runApp(const ScaffoldExampleApp());

void _reportError(Object error, StackTrace stackTrace) {
  LogUtil.e(
    'Uncaught error in Flutter runtime',
    error: error,
    stackTrace: stackTrace,
  );

  // report by Firebase Crashlytics here

  // final appInfo = getIt.get<AppInfo>();
  // FirebaseCrashlytics.instance.recordError(
  //   error,
  //   stackTrace,
  //   reason: 'a non-fatal error',
  //   information: ['Version: ${appInfo.versionName}', 'Build: ${appInfo.buildNumber}'],
  // );
}

Future<void> _runMyApp() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Show splash screen
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureApp();
  // Remove splash screen after configure app
  // FlutterNativeSplash.remove();

  // FlutterError.onError = (errorDetails) {
  //   LogUtil.e(
  //     'FlutterError onError',
  //     error: errorDetails.exception,
  //     stackTrace: errorDetails.stack,
  //   );

  //   // FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   LogUtil.e(
  //     'PlatformDispatcher onError',
  //     error: error,
  //     stackTrace: stack,
  //   );
  //   // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

  //   return true;
  // };

  runApp(const MyApp());
}
