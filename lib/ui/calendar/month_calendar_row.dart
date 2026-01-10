import 'package:flutter/material.dart';
import 'package:hamewari/calendar/week_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/day_as_number.dart';

class MonthCalendarRow extends StatelessWidget {
  const MonthCalendarRow({super.key, required this.rowPosition});

  final int rowPosition;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    Color weekColor = WeekManager.instance
        .getWeekByNumber(rowPosition + 1)
        .getWeekBackgroundColor(appTheme);

    return Column(
      children: [
        Row(
          children: List.generate(
            7,
            (int index) => index + (rowPosition * 7) + 1,
          ).map((dayNumber) => DayAsNumber(day: dayNumber)).toList(),
        ),
        Container(
          height: 2,
          decoration: BoxDecoration(
            color: weekColor,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
      ],
    );
  }
}
