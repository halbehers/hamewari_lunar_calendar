import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/providers/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/day_number.dart';

enum SeparatorPosition { start, end }

class CompactWeekRow extends StatelessWidget {
  const CompactWeekRow({super.key, required this.startOfWeek});

  final Date<dynamic> startOfWeek;

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

  Color getMoonPhaseBasedWeekColor(AppTheme appTheme) {
    final Map<int, Color> moonPhaseBasedWeekColorByIndex = {
      1: appTheme.startingWeekBackgroundColor,
      2: appTheme.refinementWeekBackgroundColor,
      3: appTheme.transformationWeekBackgroundColor,
      4: appTheme.implementationWeekBackgroundColor,
    };

    return moonPhaseBasedWeekColorByIndex[startOfWeek.weekIndexInMonth] ??
        Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    final calendarProvider = CalendarProvider.of(context);
    Color weekBackgroundColor = getMoonPhaseBasedWeekColor(appTheme);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (startOfWeek.hasMoonPhaseBasedWeeks)
              buildSeparator(weekBackgroundColor, SeparatorPosition.start),
            ...startOfWeek.getAllDatesFromWeek().map(
              (day) => DayNumber(
                day: day.day,
                isActive: day.isToday,
                onTap: () => calendarProvider.selectView(
                  viewIndex: CalendarViewFactory.weekViewIndex,
                  date: day,
                ),
                visibility: day.isSameMonth(startOfWeek)
                    ? DayVisibility.visible
                    : DayVisibility.hidden,
              ),
            ),
            if (startOfWeek.hasMoonPhaseBasedWeeks)
              buildSeparator(weekBackgroundColor, SeparatorPosition.end),
          ],
        ),
      ],
    );
  }
}
