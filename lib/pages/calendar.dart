import 'package:flutter/material.dart';
import 'package:hamewari/components/buttons/main_page_selector.dart';
import 'package:hamewari/components/headers/calendar_header.dart';
import 'package:hamewari/db/services/settings_service.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/pages/views/month.dart';
import 'package:hamewari/pages/views/week.dart';
import 'package:hamewari/pages/views/year.dart';
import 'package:hamewari/theme/app_theme.dart';

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
  CalendarView selectedView = CalendarView.year;
  late CalendarView _previousView;
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
    _previousView = selectedView;

    _settingService.findByName(SettingsService.selectedCalendarViewId).then((
      setting,
    ) {
      final restored =
          CalendarView.fromName(setting?.value) ?? CalendarView.year;

      setState(() {
        selectedView = restored;
        _previousView = restored;
      });
    });
  }

  void onViewChanged(CalendarView newSelectedView) {
    setState(() {
      _previousView = selectedView;
      selectedView = newSelectedView;
    });
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          final isForward = selectedView.index > _previousView.index;

          final offsetAnimation = Tween<Offset>(
            begin: Offset(isForward ? 1.0 : -1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: offsetAnimation, child: child),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(selectedView),
          child: selectedView.widget,
        ),
      ),
      floatingActionButton: MainPageSelector(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
