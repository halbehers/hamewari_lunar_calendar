import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/gregorian/gregorian_date.dart';
import 'package:hamewari/calendar/year_zero/year_zero_date.dart';

enum DateType { gregorian, yearZero }

class DateFactory {
  static Date<dynamic> build(
    DateType type,
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
  ]) {
    switch (type) {
      case DateType.gregorian:
        return GregorianDate(year, month, day, hour, minute);
      case DateType.yearZero:
        return YearZeroDate(year, month, day, hour, minute);
    }
  }

  static Date<dynamic> buildNow(DateType type) {
    switch (type) {
      case DateType.gregorian:
        return GregorianDate.now();
      case DateType.yearZero:
        return YearZeroDate.now();
    }
  }
}
