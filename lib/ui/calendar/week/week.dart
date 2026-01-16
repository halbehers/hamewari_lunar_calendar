import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/week/week_calendar.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';

class WeekView extends StatelessWidget implements CalendarView {
  const WeekView({super.key, this.setBackButton});

  final void Function(CalendarHeaderBackButton?)? setBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 24.0),
      child: WeekCalendar(date: MoonDate.now(), setBackButton: setBackButton),
    );
  }

  static const IconPath iconPath = IconPath.columns;
}
