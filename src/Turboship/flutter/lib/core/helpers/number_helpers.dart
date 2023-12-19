import 'dart:math';

String decimalToPercentageString(double decimal) {
  double percentage = decimal * 100;
  String percentageString = '${percentage.toStringAsFixed(1)}%';
  return percentageString;
}

String getCode(id) {
  final now = DateTime.now();
  String code = now.microsecondsSinceEpoch.toString();
  return '$code-$id';
}

int randomInt(int n) {
  Random random = Random();
  return random.nextInt(n);
}
