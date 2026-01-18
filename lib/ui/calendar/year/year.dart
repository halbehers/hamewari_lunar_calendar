import 'package:flutter/material.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/year/year_calendar.dart';

class YearView extends CalendarView {
  const YearView({super.key, required super.date});

  static const IconPath iconPath = IconPath.largeGrid;

  @override
  EdgeInsetsGeometry get padding {
    return const EdgeInsetsGeometry.symmetric(horizontal: 16.0);
  }

  @override
  Widget buildView(BuildContext context) {
    return YearCalendar(date: date);
  }
}
