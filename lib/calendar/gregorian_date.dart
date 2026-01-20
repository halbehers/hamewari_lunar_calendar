import 'dart:ui';

import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/gregorian_date_formatter.dart';

class GregorianDate extends Date<GregorianDate> {
  GregorianDate(
    super.year, [
    super.month = 1,
    super.day = 1,
    super.hour = 0,
    super.minute = 0,
  ]);

  factory GregorianDate.fromDateTime(DateTime dt) {
    return GregorianDate(dt.year, dt.month, dt.day, dt.hour, dt.minute);
  }

  factory GregorianDate.now() {
    return GregorianDate.fromDateTime(DateTime.now());
  }

  @override
  GregorianDate newInstance(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
  ]) {
    return GregorianDate(year, month, day, hour, minute);
  }

  @override
  GregorianDate get now => GregorianDate.now();

  @override
  int get weekday {
    int m = month;
    int y = year;

    // Shift Jan/Feb to months 13/14 of previous year
    if (m < 3) {
      m += 12;
      y -= 1;
    }

    final int k = y % 100;
    final int j = y ~/ 100;

    final int h = (day + (13 * (m + 1)) ~/ 5 + k + k ~/ 4 + j ~/ 4 + 5 * j) % 7;

    // Zeller: 0=Saturday, 1=Sunday, 2=Monday, ...
    // Convert to: 1=Monday, ..., 7=Sunday
    return ((h + 5) % 7) + 1;
  }

  @override
  int get numberOfMonths => 12;

  @override
  int get numberOfDaysInWeek => 7;

  @override
  int get numberOfHoursInDay => 24;

  @override
  int get numberOfMinutesInHour => 60;

  @override
  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  @override
  int numberOfDaysInMonth(int year, int month) {
    const days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    if (month == 2 && isLeapYear(year)) {
      return 29;
    }
    return days[month - 1];
  }

  @override
  GregorianDateFormatter newFormatter(String pattern, Locale? locale) {
    return GregorianDateFormatter(pattern, locale);
  }
}
