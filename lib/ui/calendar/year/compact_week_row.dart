import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/day_number.dart';

enum SeparatorPosition { start, end }

class CompactWeekRow extends StatelessWidget {
  const CompactWeekRow({super.key, required this.startOfWeek});

  final MoonDate startOfWeek;

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
    final calendarProvider = CalendarProvider.of(context);
    Color weekBackgroundColor = startOfWeek.week.getWeekBackgroundColor(
      appTheme,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSeparator(weekBackgroundColor, SeparatorPosition.start),
            ...startOfWeek.getAllDatesFromWeek().map(
              (day) => DayNumber(
                day: day.dayNumber,
                isActive: day.isToday,
                onTap: () => calendarProvider.selectView(
                  viewIndex: CalendarViewFactory.weekViewIndex,
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
