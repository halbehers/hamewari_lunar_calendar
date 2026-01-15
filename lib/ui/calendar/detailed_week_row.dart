import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/calendar/detailed_day.dart';

class DetailedWeekRow extends StatelessWidget {
  const DetailedWeekRow({super.key, required this.month, required this.week});

  final Month month;
  final Week week;

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
      children:
          List.generate(
                7,
                (int index) => index + ((week.weekNumber - 1) * 7) + 1,
              )
              .map(
                (dayNumber) => DetailedDay(
                  day: dayNumber,
                  isActive: MoonDate.isToday(
                    MoonDate(
                      MoonDate.currentYear,
                      month,
                      week,
                      Day.values[(dayNumber - 1) % 7],
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
