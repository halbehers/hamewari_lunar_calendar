import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/ui/calendar/day.dart';

enum SeparatorPosition { start, end }

class WeekRow extends StatelessWidget {
  const WeekRow({super.key, required this.week});

  final Week week;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            7,
            (int index) => index + ((week.weekNumber - 1) * 7) + 1,
          ).map((dayNumber) => Day(day: dayNumber)).toList(),
        ),
      ],
    );
  }
}
