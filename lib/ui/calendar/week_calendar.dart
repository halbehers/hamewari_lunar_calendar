import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/hour.dart';
import 'package:hamewari/ui/calendar/week_row.dart';

class WeekCalendar extends StatelessWidget {
  const WeekCalendar({super.key, required this.week, this.selectedDay = 0});

  final Week week;
  final int selectedDay;

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 0,
          child: Padding(
            padding: EdgeInsetsGeometry.directional(bottom: 16),
            child: WeekRow(week: week, selectedDay: selectedDay),
          ),
        ),
        Flexible(
          flex: 0,
          child: Padding(
            padding: EdgeInsetsGeometry.directional(bottom: 16),
            child: Text(
              "Tuesday 9th",
              style: appTheme.h4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: ListView(
            children: [
              ...List.generate(25, (index) => Hour(hour: index)),
              SizedBox.fromSize(size: Size.fromHeight(64)),
            ],
          ),
        ),
      ],
    );
  }
}
