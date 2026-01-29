import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/date_factory.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/providers/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_motion.dart';
import 'package:hamewari/ui/calendar/year/year_grid.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

const int pageOffset = 3000;

class YearCalendar extends StatefulWidget {
  const YearCalendar({super.key, required this.date});

  final Date<dynamic> date;

  @override
  State<YearCalendar> createState() => _YearCalendarState();
}

class _YearCalendarState extends State<YearCalendar> {
  late final PageController _pageController;
  late Date<dynamic> _selectedDate;
  bool _isProgrammaticPageChange = false;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.date;

    _pageController = PageController(
      initialPage: getPageNumber(_selectedDate.year),
    );

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
    AppTheme appTheme = context.appTheme;
    final calendarProvider = CalendarProvider.of(context, listen: false);

    calendarProvider.updateBackButton(
      CalendarHeaderBackButton(
        text: _selectedDate.format(
          locale: Localizations.localeOf(context),
          pattern: DateFormatter.yearPattern,
        ),
        style: _selectedDate.isCurrentYear ? appTheme.accentH2 : appTheme.h2,
      ),
    );
  }

  int getPageNumber(int year) {
    return pageOffset + year;
  }

  int getYear(int pageNumber) {
    return pageNumber - pageOffset;
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
            getPageNumber(date.year),
            duration: CalendarMotion.pageDuration,
            curve: CalendarMotion.pageCurve,
          )
          .then((_) {
            if (mounted) {
              _isProgrammaticPageChange = false;
            }
          });
    } else {
      _pageController.jumpToPage(getPageNumber(date.year));
    }

    final settingsProvider = SettingsProvider.of(context, listen: false);

    if (settingsProvider.hapticEnabled && await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.softPulse);
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = SettingsProvider.of(context);

    return PageView.builder(
      controller: _pageController,
      physics: Theme.of(context).platform == TargetPlatform.iOS
          ? const BouncingScrollPhysics()
          : const ClampingScrollPhysics(),
      onPageChanged: (pageNumber) {
        if (_isProgrammaticPageChange) return;
        _changeDate(
          DateFactory.build(
            settingsProvider.calendar,
            settingsProvider.timezone,
            getYear(pageNumber),
          ),
          animate: false,
        );
      },
      itemBuilder: (_, pageNumber) {
        final year = getYear(pageNumber);
        Date<dynamic> date = year == _selectedDate.year
            ? _selectedDate
            : DateFactory.build(
                settingsProvider.calendar,
                settingsProvider.timezone,
                year,
              );
        return YearGrid(date: date);
      },
    );
  }
}
