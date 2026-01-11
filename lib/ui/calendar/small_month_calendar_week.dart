import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/small_month_calendar_day.dart';

enum SeparatorPosition { start, end }

class SmallMonthCalendarWeek extends StatelessWidget {
  const SmallMonthCalendarWeek({super.key, required this.week});

  final Week week;

  Widget buildSeparator(Color color, SeparatorPosition position) {
    final double paddingOf = 4.0;
    EdgeInsets padding = position == SeparatorPosition.start
        ? EdgeInsets.only(right: paddingOf)
        : EdgeInsets.only(left: paddingOf);

    return Container(
      padding: padding,
      width: 2,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    Color weekBackgroundColor = CalendarManager.instance
        .getWeekByNumber(week.weekNumber)
        .getWeekBackgroundColor(appTheme);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSeparator(weekBackgroundColor, SeparatorPosition.start),
            ...List.generate(
              7,
              (int index) => index + ((week.weekNumber - 1) * 7) + 1,
            ).map((dayNumber) => SmallMonthCalendarDay(day: dayNumber)),
            buildSeparator(weekBackgroundColor, SeparatorPosition.end),
          ],
        ),
      ],
    );
  }
}
