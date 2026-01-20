import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/calendar/moon_date_format.dart';
import 'package:hamewari/helpers/string_extension.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_context.dart';
import 'package:hamewari/ui/calendar/calendar_motion.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/week/day_calendar.dart';
import 'package:hamewari/ui/calendar/week/week_row.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({
    super.key,
    required this.date,
    this.onNextWeek,
    this.onPreviousWeek,
  });

  final MoonDate date;
  final VoidCallback? onNextWeek;
  final VoidCallback? onPreviousWeek;

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  late final PageController _pageController;
  late MoonDate _selectedDate;
  bool _isProgrammaticPageChange = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date;

    _pageController = PageController(initialPage: _selectedDate.day.index);

    _setupBackButton();
  }

  @override
  void didUpdateWidget(covariant WeekCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);

    _resetSelectedDate(widget.date);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _resetSelectedDate(MoonDate date) {
    if (date == _selectedDate) return;

    setState(() {
      _selectedDate = date;
    });

    _isProgrammaticPageChange = true;
    _pageController.jumpToPage(date.day.index);
    _isProgrammaticPageChange = false;

    _setupBackButton();
  }

  void _setupBackButton() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final CalendarController calendar = Provider.of<CalendarController>(
        context,
        listen: false,
      );

      calendar.setBackButton(
        CalendarHeaderBackButton(
          text: _selectedDate.format(
            context,
            pattern: MoonDateFormat.standaloneMonthPattern,
          ),
          onTap: () => calendar.changeView(
            viewIndex: CalendarViewFactory.monthViewIndex,
            date: _selectedDate,
          ),
        ),
      );
    });
  }

  void _changeDate(MoonDate date, {bool animate = true}) async {
    setState(() {
      _selectedDate = date;
    });

    _setupBackButton();

    final CalendarController calendar = Provider.of<CalendarController>(
      context,
      listen: false,
    );

    calendar.changeView(
      viewIndex: CalendarViewFactory.weekViewIndex,
      date: date,
      animate: false,
    );

    if (animate) {
      _isProgrammaticPageChange = true;
      _pageController
          .animateToPage(
            date.day.index,
            duration: CalendarMotion.pageDuration,
            curve: CalendarMotion.pageCurve,
          )
          .then((_) {
            if (mounted) {
              _isProgrammaticPageChange = false;
            }
          });
    } else {
      _pageController.jumpToPage(date.day.index);
    }

    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.softPulse);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Column(
      children: [
        Flexible(
          flex: 0,
          child: Padding(
            padding: const EdgeInsetsGeometry.directional(bottom: 16),
            child: WeekRow(date: _selectedDate, changeDate: _changeDate),
          ),
        ),
        Flexible(
          flex: 1,
          child: PageView(
            controller: _pageController,
            physics: Theme.of(context).platform == TargetPlatform.iOS
                ? const BouncingScrollPhysics()
                : const ClampingScrollPhysics(),
            onPageChanged: (index) {
              if (_isProgrammaticPageChange) return;

              if (index == 0 && _selectedDate.day.index == 0) {
                widget.onPreviousWeek?.call();
                return;
              }

              if (index == 6 && _selectedDate.day.index == 6) {
                widget.onNextWeek?.call();
                return;
              }

              _changeDate(
                _selectedDate.getDateFromWeekDayIndex(index),
                animate: false,
              );
            },
            children: _selectedDate.getAllDatesFromWeek().map((date) {
              return Column(
                children: [
                  Flexible(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsetsGeometry.directional(bottom: 16),
                      child: Text(
                        date
                            .format(
                              context,
                              pattern:
                                  MoonDateFormat.yearMonthWeekdayDayPattern,
                            )
                            .capitalize(),
                        style: appTheme.h4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  DayCalendar(date: date),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
