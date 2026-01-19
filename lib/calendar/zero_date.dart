import 'package:hamewari/calendar/date.dart';

class YearZeroDate extends Date<YearZeroDate> {
  YearZeroDate(super.year, [super.month, super.day, super.hour, super.minute]) {
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

  // --------------------------------------------------
  // Date<T> required overrides
  // --------------------------------------------------

  @override
  YearZeroDate newInstance(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
  ]) {
    return YearZeroDate(year, month, day, hour, minute);
  }

  @override
  YearZeroDate get now {
    final now = DateTime.now().toUtc();
    return fromGregorian(now);
  }

  // --------------------------------------------------
  // Calendar rules
  // --------------------------------------------------

  @override
  bool isLeapYear(int year) {
    // Leap Zero Day every 4 years
    return year % 4 == 0;
  }

  @override
  int numberOfDaysInMonth(int year, int month) {
    return 28;
  }

  /// Every month starts on weekday 1
  /// weekday: 1..7
  @override
  int get weekday {
    return ((day - 1) % 7) + 1;
  }

  // --------------------------------------------------
  // Overrides with semantic meaning
  // --------------------------------------------------

  @override
  YearZeroDate startOfWeek() {
    final int delta = weekday - 1;
    return subtractDays(delta);
  }

  @override
  YearZeroDate startOfMonth() {
    return newInstance(year, month, 1);
  }

  @override
  YearZeroDate startOfYear() {
    return newInstance(year, 1, 1);
  }

  // --------------------------------------------------
  // Date arithmetic (corrected vs base class)
  // --------------------------------------------------

  @override
  YearZeroDate addDays(int delta) {
    int y = year;
    int m = month;
    int d = day + delta;

    while (d > 28) {
      d -= 28;
      m++;
      if (m > 13) {
        m = 1;
        y++;
      }
    }

    while (d < 1) {
      m--;
      if (m < 1) {
        m = 13;
        y--;
      }
      d += 28;
    }

    return newInstance(y, m, d, hour, minute);
  }

  @override
  YearZeroDate addMonths(int delta) {
    int total = (month - 1) + delta;
    int y = year + total ~/ 13;
    int m = (total % 13) + 1;
    return newInstance(y, m, day, hour, minute);
  }

  @override
  YearZeroDate addWeeks(int delta) {
    return addDays(delta * 7);
  }

  // --------------------------------------------------
  // Zero Day logic (outside Date<T>)
  // --------------------------------------------------

  bool get isZeroDay => false;

  static bool isZeroDayForGregorian(DateTime dt) {
    // Winter solstice approximation: Dec 21 UTC
    return dt.month == 12 && dt.day == 21;
  }

  static bool isLeapZeroDayForYear(int year) {
    return year % 4 == 0;
  }

  // --------------------------------------------------
  // Conversion from Gregorian (anchoring)
  // --------------------------------------------------

  static YearZeroDate fromGregorian(DateTime dt) {
    final yearZero = dt.year - 2028;

    // Days since winter solstice (Dec 21)
    final solstice = DateTime.utc(dt.year - 1, 12, 21);
    final daysSince = dt.difference(solstice).inDays;

    final dayIndex = daysSince % 364;
    final month = (dayIndex ~/ 28) + 1;
    final day = (dayIndex % 28) + 1;

    return YearZeroDate(yearZero, month, day, dt.hour, dt.minute);
  }

  @override
  int get numberOfMonths => 13;
}
