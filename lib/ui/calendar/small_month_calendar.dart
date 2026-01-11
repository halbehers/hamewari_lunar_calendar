import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/small_month_calendar_week.dart';

class SmallMonthCalendar extends StatelessWidget {
  const SmallMonthCalendar({super.key, required this.month});

  final Month month;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.directional(bottom: 12),
          child: Text(
            month.name,
            style: appTheme.h5,
            textAlign: TextAlign.start,
          ),
        ),
        SmallMonthCalendarWeek(week: Week.starting),
        SmallMonthCalendarWeek(week: Week.refinement),
        SmallMonthCalendarWeek(week: Week.transformation),
        SmallMonthCalendarWeek(week: Week.implementation),
      ],
    );
  }
}
