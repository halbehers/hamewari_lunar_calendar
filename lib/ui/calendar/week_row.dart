import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/day_number.dart';

enum SeparatorPosition { start, end }

class WeekRow extends StatelessWidget {
  const WeekRow({super.key, required this.week, this.selectedDay = 0});

  final Week week;
  final int selectedDay;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
              List.generate(
                    7,
                    (int index) => index + ((week.weekNumber - 1) * 7) + 1,
                  )
                  .map(
                    (dayNumber) => DayNumber(
                      day: dayNumber,
                      size: 32,
                      textStyle: appTheme.h3,
                      isSelected: dayNumber == 5,
                      isActive: dayNumber == 7,
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
