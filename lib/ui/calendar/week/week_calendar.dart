import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/helpers/string_extension.dart';
import 'package:hamewari/providers/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_motion.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/week/day_calendar.dart';
import 'package:hamewari/ui/calendar/week/week_row.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({
    super.key,
    required this.date,
    this.onNextWeek,
    this.onPreviousWeek,
  });

  final Date<dynamic> date;
  final VoidCallback? onNextWeek;
  final VoidCallback? onPreviousWeek;

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  late final PageController _pageController;
  late Date<dynamic> _selectedDate;
  bool _isProgrammaticPageChange = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date;

    _pageController = PageController(initialPage: _selectedDate.weekday - 1);

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

  void _resetSelectedDate(Date<dynamic> date) {
    if (date == _selectedDate) return;

    setState(() {
      _selectedDate = date;
    });

    _isProgrammaticPageChange = true;
    _pageController.jumpToPage(date.weekday - 1);
    _isProgrammaticPageChange = false;

    _setupBackButton();
  }

  void _setupBackButton() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final calendarProvider = CalendarProvider.of(context, listen: false);

      calendarProvider.updateBackButton(
        CalendarHeaderBackButton(
          text: _selectedDate.format(
            locale: Localizations.localeOf(context),
            pattern: DateFormatter.standaloneMonthPattern,
          ),
          onTap: () => calendarProvider.selectView(
            viewIndex: CalendarViewFactory.monthViewIndex,
          ),
        ),
      );
    });
  }

  void _changeDate(Date<dynamic> date, {bool animate = true}) async {
    setState(() {
      _selectedDate = date;
    });

    _setupBackButton();

    final calendarProvider = CalendarProvider.of(context, listen: false);

    calendarProvider.selectDate(date: date);

    if (animate) {
      _isProgrammaticPageChange = true;
      _pageController
          .animateToPage(
            date.weekday - 1,
            duration: CalendarMotion.pageDuration,
            curve: CalendarMotion.pageCurve,
          )
          .then((_) {
            if (mounted) {
              _isProgrammaticPageChange = false;
            }
          });
    } else {
      _pageController.jumpToPage(date.weekday - 1);
    }

    final settingsProvider = SettingsProvider.of(context, listen: false);

    if (settingsProvider.hapticEnabled && await Vibration.hasVibrator()) {
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
                        (date.format(
                                  locale: Localizations.localeOf(context),
                                  pattern:
                                      DateFormatter.yearMonthWeekdayDayPattern,
                                )
                                as String)
                            .capitalize(),
                        style: appTheme.subduedH4,
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
