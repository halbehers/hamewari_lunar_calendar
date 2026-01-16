import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/calendar/month/month_calendar.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';

class MonthView extends StatelessWidget implements CalendarView {
  const MonthView({super.key, this.setBackButton});

  final void Function(CalendarHeaderBackButton?)? setBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 32.0),
      child: MonthCalendar(
        date: MoonDate.startOfMonth(),
        setBackButton: setBackButton,
      ),
    );
  }

  static const IconPath iconPath = IconPath.grid;
}
