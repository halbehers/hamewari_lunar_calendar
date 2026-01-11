import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/ui/calendar/compact_month.dart';

class YearView extends StatelessWidget {
  const YearView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> months = CalendarManager.instance.months
        .map((month) => CompactMonth(month: month))
        .toList();

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: months.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 164,
        ),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
          child: months[index],
        ),
      ),
    );
  }
}
