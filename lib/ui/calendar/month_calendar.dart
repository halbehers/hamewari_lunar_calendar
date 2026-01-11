import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/month_calendar_week.dart';

class MonthCalendar extends StatelessWidget {
  const MonthCalendar({super.key, required this.month});

  final Month month;

  Widget buildSeparator(AppTheme appTheme) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 8),
      child: Container(
        height: 1,
        decoration: BoxDecoration(color: appTheme.borderColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 0,
          child: Padding(
            padding: EdgeInsetsGeometry.directional(bottom: 32),
            child: Text(month.name, style: appTheme.h2),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsetsGeometry.only(bottom: 90),
            child: Column(
              children: [
                Flexible(child: MonthCalendarWeek(week: Week.starting)),
                buildSeparator(appTheme),
                Flexible(child: MonthCalendarWeek(week: Week.refinement)),
                buildSeparator(appTheme),
                Flexible(child: MonthCalendarWeek(week: Week.transformation)),
                buildSeparator(appTheme),
                Flexible(child: MonthCalendarWeek(week: Week.implementation)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
