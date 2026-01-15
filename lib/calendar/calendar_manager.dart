import 'package:hamewari/calendar/moon_date.dart';

class CalendarManager {
  CalendarManager._privateConstructor();
  static final CalendarManager instance = CalendarManager._privateConstructor();

  List<Month> get months {
    return Month.values;
  }

  Month getMonthByNumber(int monthNumber) {
    return Month.values[monthNumber - 1];
  }

  List<Week> get weeks {
    return Week.values;
  }

  Week getWeekByNumber(int weekNumber) {
    return Week.values[weekNumber - 1];
  }
}
