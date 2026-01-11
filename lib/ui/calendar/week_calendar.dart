import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/detailed_week_row.dart';
import 'package:hamewari/ui/calendar/week_row.dart';

class WeekCalendar extends StatelessWidget {
  const WeekCalendar({super.key, required this.week});

  final Week week;

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
            child: WeekRow(week: week),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsetsGeometry.only(bottom: 90),
            child: Column(
              children: [
                Flexible(child: DetailedWeekRow(week: Week.starting)),
                buildSeparator(appTheme),
                Flexible(child: DetailedWeekRow(week: Week.refinement)),
                buildSeparator(appTheme),
                Flexible(child: DetailedWeekRow(week: Week.transformation)),
                buildSeparator(appTheme),
                Flexible(child: DetailedWeekRow(week: Week.implementation)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
