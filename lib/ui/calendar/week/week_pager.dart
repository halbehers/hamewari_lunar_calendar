import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/calendar/calendar_motion.dart';
import 'package:hamewari/ui/calendar/week/week_calendar.dart';

// TODO: fix that
class WeekPager extends StatefulWidget {
  const WeekPager({super.key, required this.initialDate});

  final MoonDate initialDate;

  @override
  State<WeekPager> createState() => _WeekPagerState();
}

class _WeekPagerState extends State<WeekPager> {
  late final PageController _weekController;
  late MoonDate _weekStart;

  @override
  void initState() {
    super.initState();
    _weekStart = widget.initialDate.startOfWeek();
    _weekController = PageController(initialPage: 0);
  }

  void _changeWeek(int delta) {
    setState(() {
      _weekStart = _weekStart.addWeeks(delta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _weekController,
      onPageChanged: (index) {
        _changeWeek(index - 1);
        _weekController.jumpToPage(1);
      },
      itemBuilder: (_, index) {
        return WeekCalendar(
          date: _weekStart.addWeeks(index - 1),
          onNextWeek: () => _weekController.nextPage(
            duration: CalendarMotion.pageDuration,
            curve: CalendarMotion.pageCurve,
          ),
          onPreviousWeek: () => _weekController.previousPage(
            duration: CalendarMotion.pageDuration,
            curve: CalendarMotion.pageCurve,
          ),
        );
      },
      itemCount: 3,
    );
  }
}
