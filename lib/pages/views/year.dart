import 'package:flutter/material.dart';
import 'package:hamewari/calendar/month_manager.dart';
import 'package:hamewari/ui/calendar/month_calendar.dart';

class YearView extends StatelessWidget {
  const YearView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> months = MonthManager.instance.months
        .map((month) => MonthCalendar(month: month))
        .toList();

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 32),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: months,
      ),
    );
  }
}
