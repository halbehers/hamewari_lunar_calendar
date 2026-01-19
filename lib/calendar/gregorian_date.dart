import 'package:hamewari/calendar/date.dart';

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
    // Shift Jan/Feb to months 13/14 of previous year
    if (month < 3) {
      month += 12;
      year -= 1;
    }

    final int k = year % 100;
    final int j = year ~/ 100;

    final int h =
        (day + (13 * (month + 1)) ~/ 5 + k + k ~/ 4 + j ~/ 4 + 5 * j) % 7;

    // Zeller: 0=Saturday, 1=Sunday, 2=Monday, ...
    // Convert to: 1=Monday, ..., 7=Sunday
    return ((h + 5) % 7) + 1;
  }

  @override
  int get numberOfMonths => 12;

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
}
