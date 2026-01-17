import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/day_number.dart';

enum SeparatorPosition { start, end }

class CompactWeekRow extends StatelessWidget {
  const CompactWeekRow({super.key, required this.date, this.changeView});

  final MoonDate date;
  final Function({required int viewIndex, required MoonDate date})? changeView;

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
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    Color weekBackgroundColor = date.week.getWeekBackgroundColor(appTheme);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSeparator(weekBackgroundColor, SeparatorPosition.start),
            ...date.getAllDatesFromWeek().map(
              (day) => DayNumber(
                day: day.dayNumber,
                isActive: MoonDate.isToday(date.withDay(day.day)),
                onTap: () => changeView?.call(
                  viewIndex: CalendarView.weekView,
                  date: day,
                ),
              ),
            ),
            buildSeparator(weekBackgroundColor, SeparatorPosition.end),
          ],
        ),
      ],
    );
  }
}
