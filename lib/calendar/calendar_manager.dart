import 'package:hamewari/calendar/moon_date.dart';

abstract class Event {}

abstract class CalendarViewChangedEvent implements Event {
  void onCalendarViewChanged(int selectedView, MoonDate selectedDate);
}

class CalendarManager {
  CalendarManager._privateConstructor();
  static final CalendarManager instance = CalendarManager._privateConstructor();

  int selectedViewId = 0;
  MoonDate selectedDate = MoonDate.now();
}
