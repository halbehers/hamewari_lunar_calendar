import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/ui/calendar/month_calendar.dart';

class MonthView extends StatelessWidget {
  const MonthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.0),
      child: MonthCalendar(month: Month.electric),
    );
  }
}
