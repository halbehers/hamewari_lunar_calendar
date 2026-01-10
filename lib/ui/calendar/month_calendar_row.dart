import 'package:flutter/material.dart';
import 'package:hamewari/ui/calendar/day_as_number.dart';

class MonthCalendarRow extends StatelessWidget {
  const MonthCalendarRow({super.key, required this.rowPosition});

  final int rowPosition;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        7,
        (int index) => index + (rowPosition * 7) + 1,
      ).map((dayNumber) => DayAsNumber(day: dayNumber)).toList(),
    );
  }
}
