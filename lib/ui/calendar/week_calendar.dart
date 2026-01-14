import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/day_calendar.dart';
import 'package:hamewari/ui/calendar/week_row.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({super.key, required this.week, this.selectedDay = 0});

  final Week week;
  final int selectedDay;

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 0,
          child: Padding(
            padding: const EdgeInsetsGeometry.directional(bottom: 16),
            child: WeekRow(week: widget.week, selectedDay: widget.selectedDay),
          ),
        ),
        Flexible(
          flex: 0,
          child: Padding(
            padding: const EdgeInsetsGeometry.directional(bottom: 16),
            child: Text(
              "Tuesday 9th",
              style: appTheme.h4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const DayCalendar(),
      ],
    );
  }
}
