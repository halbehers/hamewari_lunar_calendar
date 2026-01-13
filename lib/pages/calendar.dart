import 'package:flutter/material.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:hamewari/db/services/settings_service.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/ui/calendar/views/month.dart';
import 'package:hamewari/ui/calendar/views/week.dart';
import 'package:hamewari/ui/calendar/views/year.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

enum CalendarView {
  year(YearView()),
  month(MonthView()),
  week(WeekView());

  const CalendarView(this.widget);

  final Widget widget;

  static CalendarView? fromName(String? name) {
    if (name == null) return null;

    return CalendarView.values.where((value) => value.name == name).firstOrNull;
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final PageController _pageController;
  CalendarView selectedView = CalendarView.year;
  final SettingsService _settingService = SettingsService();

  void persistViewChanged(CalendarView newSelectedView) {
    _settingService.setupByName(
      SettingsService.selectedCalendarViewId,
      newSelectedView.name,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedView.index);

    _settingService.findByName(SettingsService.selectedCalendarViewId).then((
      setting,
    ) {
      final restored =
          CalendarView.fromName(setting?.value) ?? CalendarView.year;

      setState(() {
        selectedView = restored;
        _pageController.jumpToPage(restored.index);
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onViewChanged(CalendarView newSelectedView) async {
    setState(() {
      selectedView = newSelectedView;
    });

    _pageController.animateToPage(
      newSelectedView.index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );

    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.softPulse);
    }

    persistViewChanged(newSelectedView);
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: CalendarHeader(
        selectedView: selectedView,
        onViewChanged: onViewChanged,
      ),
      body: PageView(
        controller: _pageController,
        physics: Theme.of(context).platform == TargetPlatform.iOS
            ? const BouncingScrollPhysics()
            : const ClampingScrollPhysics(),
        onPageChanged: (index) {
          final newView = CalendarView.values[index];
          setState(() {
            selectedView = newView;
          });

          _settingService.setupByName(
            SettingsService.selectedCalendarViewId,
            newView.name,
          );
        },
        children: CalendarView.values.map((view) {
          return view.widget;
        }).toList(),
      ),
      floatingActionButton: const MainPageSelector(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
