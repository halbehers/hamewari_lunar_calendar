import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/day_number.dart';
import 'package:intl/intl.dart';

enum SeparatorPosition { start, end }

class WeekRow extends StatelessWidget {
  const WeekRow({super.key, required this.date});

  final MoonDate date;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    print(
      "format MMMMEEEEd: ${DateFormat.yMMMMEEEEd().format(DateTime.now())}",
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: date
              .getAllDatesFromWeek()
              .map(
                (day) => DayNumber(
                  day: day.dayNumber,
                  size: 32,
                  textStyle: appTheme.h3,
                  activeTextStyle: appTheme.invertedH3,
                  isSelected: date.isSameDayNumber(day.dayNumber),
                  isActive: MoonDate.isToday(day),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
