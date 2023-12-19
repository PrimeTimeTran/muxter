import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../configs/locale_config.dart';
import '../extensions/all.dart';

class DateTimeUtil {
  DateTimeUtil._();

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);

    return (to.difference(from).inHours / 24).round();
  }

  static DateTime startTimeOfDate() {
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
    );
  }

  static String timeAgo(BuildContext context, DateTime dateTime) {
    // return hours ago if less than 24 hours else return date
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inHours < 24) {
      final hours = diff.inHours;
      final minutes = diff.inMinutes;

      if (minutes == 0) {
        // return context.l10n.time_ago__just_now;
      } else if (hours == 0) {
        // return context.l10n.time_ago__minutes(minutes);
      } else if (hours == 1) {
        // return context.l10n.time_ago__1_hour;
      } else {
        // return context.l10n.time_ago__hours(hours);
      }
      return '';
    } else {
      return dateTime.toStringWithDefaultFormat();
    }
  }

  static int timezoneOffset() {
    return DateTime.now().timeZoneOffset.inHours;
  }

  static DateTime? toDateTime(String dateTimeString, {bool isUtc = false}) {
    final dateTime = DateTime.tryParse(dateTimeString);
    if (dateTime != null) {
      if (isUtc) {
        return DateTime.utc(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond,
        );
      }

      return dateTime;
    }

    return null;
  }

  static DateTime toLocalFromTimestamp({required int utcTimestampMillis}) {
    return DateTime.fromMillisecondsSinceEpoch(utcTimestampMillis, isUtc: true)
        .toLocal();
  }

  static DateTime? toNormalizeDateTime(
    String dateTimeString, {
    bool isUtc = false,
  }) {
    final dateTime = DateTime.tryParse('-123450101 $dateTimeString');
    if (dateTime != null) {
      if (isUtc) {
        return DateTime.utc(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond,
        );
      }

      return dateTime;
    }

    return null;
  }

  static DateTime toUtcFromTimestamp(int localTimestampMillis) {
    return DateTime.fromMillisecondsSinceEpoch(localTimestampMillis).toUtc();
  }

  static DateTime? tryParse({
    String? date,
    String? format,
    String locale = LocaleConfig.defaultLocale,
  }) {
    if (date == null) {
      return null;
    }

    if (format == null) {
      return DateTime.tryParse(date);
    }

    final DateFormat dateFormat = DateFormat(format, locale);
    try {
      return dateFormat.parse(date);
    } catch (e) {
      return null;
    }
  }
}
