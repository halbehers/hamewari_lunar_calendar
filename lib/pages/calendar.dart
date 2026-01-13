import 'package:flutter/material.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/ui/calendar/views/month.dart';
import 'package:hamewari/ui/calendar/views/week.dart';
import 'package:hamewari/ui/calendar/views/year.dart';
import 'package:provider/provider.dart';
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
  late CalendarView _selectedView;

  @override
  void initState() {
    super.initState();

    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: false,
    );

    _selectedView = settingsProvider.selectedCalendarView;

    _pageController = PageController(initialPage: _selectedView.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _changeView(
    CalendarView newView, {
    required SettingsProvider settingsProvider,
    bool animate = true,
  }) async {
    if (newView == _selectedView) return;

    setState(() {
      _selectedView = newView;
    });

    if (animate) {
      _pageController.animateToPage(
        newView.index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    } else {
      _pageController.jumpToPage(newView.index);
    }

    settingsProvider.setSelectedCalendarView(newView, persistChange: false);

    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.softPulse);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final settingsProvider = context.watch<SettingsProvider>();

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: CalendarHeader(
        selectedView: _selectedView,
        onViewChanged: (view) =>
            _changeView(view, settingsProvider: settingsProvider),
      ),
      body: PageView(
        controller: _pageController,
        physics: Theme.of(context).platform == TargetPlatform.iOS
            ? const BouncingScrollPhysics()
            : const ClampingScrollPhysics(),
        onPageChanged: (index) {
          final view = CalendarView.values[index];
          _changeView(view, settingsProvider: settingsProvider, animate: false);
        },
        children: CalendarView.values.map((view) => view.widget).toList(),
      ),
      floatingActionButton: const MainPageSelector(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
