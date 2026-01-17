import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/year/year_calendar.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';

class YearView extends StatelessWidget implements CalendarView {
  const YearView({super.key, required this.date, this.setBackButton});

  final MoonDate date;
  final void Function(CalendarHeaderBackButton?)? setBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16.0),
      child: YearCalendar(date: date, setBackButton: setBackButton),
    );
  }

  static const IconPath iconPath = IconPath.largeGrid;
}
