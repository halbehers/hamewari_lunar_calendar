import 'package:flutter/material.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/week/week_calendar.dart';

class WeekView extends CalendarView {
  const WeekView({super.key, required super.date});

  @override
  bool get displayTodayButton => !date.isToday;

  @override
  Widget buildView(BuildContext context) {
    return WeekCalendar(date: date);
  }

  static const IconPath iconPath = IconPath.columns;
}
