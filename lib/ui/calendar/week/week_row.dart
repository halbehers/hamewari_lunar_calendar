import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/day_number.dart';

enum SeparatorPosition { start, end }

class WeekRow extends StatelessWidget {
  const WeekRow({super.key, required this.date, required this.changeDate});

  final Date<dynamic> date;
  final void Function(Date<dynamic> date) changeDate;

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
                  day: day.day,
                  size: 36,
                  textStyle: appTheme.h3,
                  activeTextStyle: appTheme.invertedH3,
                  isSelected: date.isSameDay(day),
                  isActive: day.isToday,
                  onTap: () => changeDate(day),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
