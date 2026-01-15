import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/day_number.dart';

enum SeparatorPosition { start, end }

class WeekRow extends StatelessWidget {
  const WeekRow({super.key, required this.date, required this.changeDate});

  final MoonDate date;
  final void Function(MoonDate date) changeDate;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: date
              .getAllDatesFromWeek()
              .map(
                (day) => DayNumber(
                  day: day.dayNumber,
                  size: 36,
                  textStyle: appTheme.h3,
                  activeTextStyle: appTheme.invertedH3,
                  isSelected: date.isSameDayNumber(day.dayNumber),
                  isActive: MoonDate.isToday(day),
                  onTap: () => changeDate(day),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
