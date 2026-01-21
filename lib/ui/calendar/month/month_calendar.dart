import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/calendar/moon_date_format.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_context.dart';
import 'package:hamewari/ui/calendar/calendar_motion.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/month/detailed_week_row.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({super.key, required this.date});

  final MoonDate date;

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late final PageController _pageController;
  late MoonDate _selectedDate;
  bool _isProgrammaticPageChange = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date;

    _pageController = PageController(initialPage: _selectedDate.month.index);

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
    final CalendarController calendar = Provider.of<CalendarController>(
      context,
      listen: false,
    );
    calendar.setBackButton(
      CalendarHeaderBackButton(
        text: _selectedDate.format(
          context,
          pattern: MoonDateFormat.yearPattern,
        ),
        onTap: () =>
            calendar.selectView(viewIndex: CalendarViewFactory.yearViewIndex),
      ),
    );
  }

  void _changeDate(MoonDate date, {bool animate = true}) async {
    setState(() {
      _selectedDate = date;
    });

    setupBackButton();

    if (animate) {
      _isProgrammaticPageChange = true;
      _pageController
          .animateToPage(
            date.month.index,
            duration: CalendarMotion.pageDuration,
            curve: CalendarMotion.pageCurve,
          )
          .then((_) {
            if (mounted) {
              _isProgrammaticPageChange = false;
            }
          });
    } else {
      _pageController.jumpToPage(date.month.index);
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
    AppLocalizations t = AppLocalizations.of(context)!;

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
                  t.moon_month_title(
                    _selectedDate.month.monthNumber.toString(),
                  ),
                  style:
                      (_selectedDate.year == MoonDate.currentYear &&
                          _selectedDate.month == MoonDate.currentMonth)
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
                  children: [
                    Flexible(
                      child: DetailedWeekRow(
                        date: _selectedDate.startOfWeek(
                          weekOverride: Week.starting,
                        ),
                      ),
                    ),
                    buildSeparator(appTheme),
                    Flexible(
                      child: DetailedWeekRow(
                        date: _selectedDate.startOfWeek(
                          weekOverride: Week.refinement,
                        ),
                      ),
                    ),
                    buildSeparator(appTheme),
                    Flexible(
                      child: DetailedWeekRow(
                        date: _selectedDate.startOfWeek(
                          weekOverride: Week.transformation,
                        ),
                      ),
                    ),
                    buildSeparator(appTheme),
                    Flexible(
                      child: DetailedWeekRow(
                        date: _selectedDate.startOfWeek(
                          weekOverride: Week.implementation,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
