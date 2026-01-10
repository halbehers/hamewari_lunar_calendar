import 'package:flutter/material.dart';
import 'package:hamewari/calendar/month_manager.dart';
import 'package:hamewari/ui/calendar/month_calendar_row.dart';

class MonthCalendar extends StatelessWidget {
  const MonthCalendar({super.key, required this.month});

  final Month month;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(month.name),
          MonthCalendarRow(rowPosition: 0),
          MonthCalendarRow(rowPosition: 1),
          MonthCalendarRow(rowPosition: 2),
          MonthCalendarRow(rowPosition: 3),
        ],
      ),
    );
  }
}
