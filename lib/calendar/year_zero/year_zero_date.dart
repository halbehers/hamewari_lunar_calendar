import 'dart:ui';

import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/year_zero/year_zero_date_formatter.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:timezone/timezone.dart';

class YearZeroDate extends Date<YearZeroDate> {
  YearZeroDate(
    super.timezone,
    super.year, [
    super.month,
    super.day,
    super.hour,
    super.minute,
  ]) {
    _validate();
  }

  void _validate() {
    if (month < 1 || month > 13) {
      throw ArgumentError('Month must be between 1 and 13');
    }
    if (day < 1 || day > 28) {
      throw ArgumentError('Day must be between 1 and 28');
    }
    if (hour < 0 || hour > 23) {
      throw ArgumentError('Hour must be 0-23');
    }
    if (minute < 0 || minute > 59) {
      throw ArgumentError('Minute must be 0-59');
    }
  }

  @override
  YearZeroDate newInstance(
    SettingTimezone timezone,
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
  ]) {
    return YearZeroDate(timezone, year, month, day, hour, minute);
  }

  factory YearZeroDate.now(SettingTimezone? timezone) {
    final now = DateTime.now().toUtc();
    return fromDateTime(now, timezone);
  }

  @override
  YearZeroDate get now {
    return YearZeroDate.now(timezone);
  }

  @override
  int get numberOfMonths => 13;

  @override
  int get numberOfDaysInWeek => 7;

  @override
  int get numberOfHoursInDay => 24;

  @override
  int get numberOfMinutesInHour => 60;

  @override
  bool get hasMoonPhaseBasedWeeks => true;

  @override
  bool isLeapYear(int year) => year % 4 == 0;

  @override
  bool get hasOutOfCalendarDays => true;

  @override
  List<OutOfCalendarDayBounds<YearZeroDate>> get outOfCalendarDaysBounds => [
    OutOfCalendarDayBounds(
      YearZeroDate(timezone, year, 13, 28),
      YearZeroDate(timezone, year + 1, 1, 1),
    ),
  ];

  @override
  int numberOfDaysInMonth(int year, int month) => 28;

  @override
  int get weekday => ((day - 1) % 7) + 1;

  bool get isZeroDay => false;

  static bool isZeroDayForGregorian(DateTime dt) {
    // Winter solstice approximation: Dec 21 UTC
    return dt.month == 12 && dt.day == 21;
  }

  static bool isLeapZeroDayForYear(int year) {
    return year % 4 == 0;
  }

  static YearZeroDate fromDateTime(DateTime dt, SettingTimezone? timezone) {
    late DateTime computedDateTime;

    if (timezone == null || timezone.isEmpty()) {
      computedDateTime = dt;
    } else {
      computedDateTime = TZDateTime.from(dt, timezone.location!);
    }

    final yearZero = computedDateTime.year - 2028;

    // Days since winter solstice (Dec 21)
    final solstice = DateTime.utc(computedDateTime.year - 1, 12, 21);
    final daysSince = dt.difference(solstice).inDays;

    final dayIndex = daysSince % 364;
    final month = (dayIndex ~/ 28) + 1;
    final day = (dayIndex % 28) + 1;

    return YearZeroDate(
      timezone ?? SettingTimezone.empty,
      yearZero,
      month,
      day,
      computedDateTime.hour,
      computedDateTime.minute,
    );
  }

  @override
  YearZeroDateFormatter newFormatter(String pattern, Locale? locale) {
    return YearZeroDateFormatter(pattern, locale);
  }
}
