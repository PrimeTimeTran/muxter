import 'package:intl/intl.dart';

import '../../presentation/common_blocs/app/app_bloc.dart';
import '../configs/di/di.dart';

class MoneyUtil {
  const MoneyUtil._();

  static NumberFormat get currencyFormatter {
    final String locale = getIt.get<AppBloc>().state.locale;

    return NumberFormat.simpleCurrency(locale: locale, decimalDigits: 0);
  }

  static String cleanFormattedMoney(string) {
    return string.replaceAll(RegExp(r'[^0-9]'), '');
  }

  static String format(double value) {
    return currencyFormatter.format(value);
  }

  static String formatWithOutSymbol(double value) {
    return currencyFormatter.format(value).replaceFirst(currencyFormatter.currencySymbol, '').trim();
  }
}
