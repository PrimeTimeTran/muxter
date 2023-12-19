import 'package:intl/intl.dart';

String formattedDate = DateFormat("MMMM d',' y").format(DateTime.now());
DateTime today = DateTime.now();
DateTime todayDate = DateTime(today.year, today.month, today.day);
DateTime todayLastDayOfYear = DateTime(today.year, 12, 31);
String cleanDate(item) => DateFormat.yMMMd().format(item);

int daysInMonth(int year, int month) {
  if (month < 1 || month > 12) {
    throw ArgumentError('Month must be between 1 and 12');
  }
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
  return lastDayOfMonth.day;
}

getCurrentMonth() {
  DateTime now = DateTime.now();
  String formattedMonth = DateFormat('MMMM').format(now);
  return formattedMonth;
}

String getLocalMonth(String str) {
  DateTime utcDate = DateTime.parse(str);
  DateTime localDT = utcDate.toLocal();
  String formatted = DateFormat('MMMM').format(localDT);
  return formatted;
}

bool isSameMonth(dateToCheck) {
  DateTime then = DateTime.parse(dateToCheck).toUtc();
  DateTime now = DateTime.now();
  final sameYear = then.year == now.year;
  final sameMonth = then.month == now.month;
  return sameMonth && sameYear;
}

String parseUTCToDayMonth(String utcString) {
  final dateTime = DateTime.parse(utcString);
  final dateFormat = DateFormat('M/d');
  final formattedDate = dateFormat.format(dateTime);

  return formattedDate;
}

sortOnCreatedAt(items) {
  items.sort((a, b) {
    final DateTime dateTimeA = DateTime.parse(a.createdAt);
    final DateTime dateTimeB = DateTime.parse(b.createdAt);
    return dateTimeA.compareTo(dateTimeB);
  });
  return items;
}

String toUtcFormatted(String dateTimeString) {
  DateTime utcDT = DateTime.parse(dateTimeString);
  DateTime localDT = utcDT.toLocal();
  String formatted = DateFormat('MM-dd-yy hh:mm a').format(localDT);
  return formatted;
}
