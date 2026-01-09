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
    _settingService.findByName(SettingsService.selectedCalendarViewId).then((
      setting,
    ) {
      setState(() {
        selectedView =
            CalendarView.fromName(setting?.value) ?? CalendarView.year;
      });
    });
  }

  void onViewChanged(CalendarView newSelectedView) {
    setState(() {
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
      body: selectedView.widget,
      floatingActionButton: MainPageSelector(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
