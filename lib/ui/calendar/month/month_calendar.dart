import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/providers/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_motion.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/month/detailed_week_row.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({super.key, required this.date});

  final Date<dynamic> date;

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late final PageController _pageController;
  late Date<dynamic> _selectedDate;
  bool _isProgrammaticPageChange = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date;

    _pageController = PageController(initialPage: _selectedDate.month - 1);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      setupBackButton();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void setupBackButton() {
    final calendarProvider = CalendarProvider.of(context, listen: false);
    calendarProvider.updateBackButton(
      CalendarHeaderBackButton(
        text: _selectedDate.format(
          locale: Localizations.localeOf(context),
          pattern: DateFormatter.yearPattern,
        ),
        onTap: () => calendarProvider.selectView(
          viewIndex: CalendarViewFactory.yearViewIndex,
        ),
      ),
    );
  }

  void _changeDate(Date<dynamic> date, {bool animate = true}) async {
    setState(() {
      _selectedDate = date;
    });

    setupBackButton();

    if (animate) {
      _isProgrammaticPageChange = true;
      _pageController
          .animateToPage(
            date.month - 1,
            duration: CalendarMotion.pageDuration,
            curve: CalendarMotion.pageCurve,
          )
          .then((_) {
            if (mounted) {
              _isProgrammaticPageChange = false;
            }
          });
    } else {
      _pageController.jumpToPage(date.month - 1);
    }

    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.softPulse);
    }
  }

  Widget buildSeparator(AppTheme appTheme) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(bottom: 8),
      child: Container(
        height: 1,
        decoration: BoxDecoration(color: appTheme.borderColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    return PageView(
      controller: _pageController,
      physics: Theme.of(context).platform == TargetPlatform.iOS
          ? const BouncingScrollPhysics()
          : const ClampingScrollPhysics(),
      onPageChanged: (index) {
        if (_isProgrammaticPageChange) return;
        _changeDate(
          _selectedDate.getStartOfMonthDateFromMonthIndex(index),
          animate: false,
        );
      },
      children: _selectedDate.getAllStartOfMonthsFromYear().map((date) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 0,
              child: Padding(
                padding: const EdgeInsetsGeometry.directional(bottom: 32),
                child: Text(
                  _selectedDate.format(
                    pattern: DateFormatter.standaloneMonthPattern,
                    locale: Localizations.localeOf(context),
                  ),
                  style: (_selectedDate.isCurrentMonth)
                      ? appTheme.accentH2
                      : appTheme.h2,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsetsGeometry.only(bottom: 90),
                child: Column(
                  // TODO: add separators (buildSeparator(appTheme))
                  children: _selectedDate.getAllStartOfWeeksFromMonth().map((
                    startOfWeek,
                  ) {
                    return Flexible(child: DetailedWeekRow(date: startOfWeek));
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
