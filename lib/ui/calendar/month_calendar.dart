import 'package:flutter/material.dart';
import 'package:hamewari/calendar/month_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/month_calendar_row.dart';

class MonthCalendar extends StatelessWidget {
  const MonthCalendar({super.key, required this.month});

  final Month month;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.directional(bottom: 12),
          child: Text(month.name, style: appTheme.h4),
        ),
        MonthCalendarRow(rowPosition: 0),
        MonthCalendarRow(rowPosition: 1),
        MonthCalendarRow(rowPosition: 2),
        MonthCalendarRow(rowPosition: 3),
      ],
    );
  }
}
