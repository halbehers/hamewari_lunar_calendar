import 'package:flutter/material.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/month/month_calendar.dart';

class MonthView extends CalendarView {
  const MonthView({super.key, required super.date});

  @override
  Widget buildView(BuildContext context) {
    return MonthCalendar(date: date);
  }

  static const IconPath iconPath = IconPath.grid;
}
