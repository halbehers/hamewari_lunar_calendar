import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/calendar/month/detailed_day.dart';

class DetailedWeekRow extends StatelessWidget {
  const DetailedWeekRow({super.key, required this.date});

  final MoonDate date;

  @override
  Widget build(BuildContext context) {
    // Event event1 = Event();
    // event1.name = "Water plants";
    // event1.startingAt = DateTime(2026, 2, 24, 9, 30);
    // event1.endingAt = DateTime(2026, 2, 24, 10, 0);
    // Event event2 = Event();
    // event2.name = "Burn candle";
    // event2.startingAt = DateTime(2026, 2, 24, 11, 0);
    // event2.endingAt = DateTime(2026, 2, 24, 11, 30);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: date
          .getAllDatesFromWeek()
          .map((day) => DetailedDay(date: day, isActive: day.isToday))
          .toList(),
    );
  }
}
