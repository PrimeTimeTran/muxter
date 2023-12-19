import 'dart:math';

export 'color_util.dart';
export 'connectivity_util.dart';
export 'date_time_util.dart';
export 'device_util.dart';
export 'file_util.dart';
export 'intent_util.dart';
export 'log_util.dart';
export 'money_util.dart';
export 'number_util.dart';
export 'platform_util.dart';
export 'validation_util.dart';
export 'view_util.dart';

sample(list) {
  var randomItem =
      list.toSet().toList().elementAt(Random().nextInt(list.length));
  return randomItem;
}

String sampleTheme() {
  final kolors = [
    'Blue',
    'Green',
    'Gold',
    'Orange',
    'Pink',
    'Purple',
    'Red',
  ];
  Random random = Random();
  int randomIndex = random.nextInt(kolors.length);
  String randomColor = kolors[randomIndex];

  return randomColor;
}
