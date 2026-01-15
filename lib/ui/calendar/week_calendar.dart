import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/calendar/moon_date_formatting.dart';
import 'package:hamewari/helpers/string_extension.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/day_calendar.dart';
import 'package:hamewari/ui/calendar/week_row.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({super.key, required this.date});

  final MoonDate date;

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
            child: WeekRow(date: widget.date),
          ),
        ),
        Flexible(
          flex: 0,
          child: Padding(
            padding: const EdgeInsetsGeometry.directional(bottom: 16),
            child: Text(
              widget.date
                  .format(
                    context,
                    pattern: MoonDateFormat.monthWeekdayDayPattern,
                  )
                  .capitalize(),
              style: appTheme.h4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DayCalendar(date: widget.date),
      ],
    );
  }
}
