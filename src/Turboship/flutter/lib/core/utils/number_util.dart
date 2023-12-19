import 'package:intl/intl.dart';

import '../../presentation/common_blocs/app/app_bloc.dart';
import '../configs/di/di.dart';

class NumberUtil {
  const NumberUtil._();

  static String formatDecimal(
    double number, {
    int decimalDigits = 2,
  }) {
    final String locale = getIt.get<AppBloc>().state.locale;
    final formatter = NumberFormat.decimalPatternDigits(
      locale: locale,
      decimalDigits: decimalDigits,
    );

    return formatter.format(number);
  }
}
