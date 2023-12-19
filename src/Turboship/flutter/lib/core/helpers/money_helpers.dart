import 'package:intl/intl.dart';

final currencyFormat = NumberFormat.currency(
  locale: 'vi_VN',
  symbol: '₫',
);

String cleanFormattedMoney(string) {
  return string.replaceAll(RegExp(r'[^0-9]'), '');
}

String formatMoney(val) {
  if (val is double) val = '$val';
  String formatted = currencyFormat.format(double.parse(val));
  if (double.parse(val) >= 0) {
    formatted = formatted.replaceAll('-', '');
  }
  return formatted;
}
