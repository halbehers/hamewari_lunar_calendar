import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/calendar/week_calendar.dart';

class WeekView extends StatelessWidget {
  const WeekView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 24.0),
      child: WeekCalendar(date: MoonDate.now()),
    );
  }
}
