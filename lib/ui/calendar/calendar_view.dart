import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/buttons/button_stack.dart';
import 'package:hamewari/ui/calendar/month/month.dart';
import 'package:hamewari/ui/calendar/week/week.dart';
import 'package:hamewari/ui/calendar/year/year.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';

enum _View {
  year(YearView.iconPath),
  month(MonthView.iconPath),
  week(WeekView.iconPath);

  const _View(this.iconPath);

  final IconPath iconPath;
}

abstract class CalendarView extends Widget {
  static const int yearView = 0;
  static const int monthView = 1;
  static const int weekView = 2;

  factory CalendarView(
    int index, {
    required MoonDate date,
    void Function(CalendarHeaderBackButton?)? setBackButton,
    void Function({required int viewIndex, required MoonDate date})? changeView,
  }) {
    switch (index) {
      case yearView:
        return YearView(
          date: date,
          setBackButton: setBackButton,
          changeView: changeView,
        );
      case monthView:
        return MonthView(
          date: date,
          setBackButton: setBackButton,
          changeView: changeView,
        );
      case weekView:
        return WeekView(
          date: date,
          setBackButton: setBackButton,
          changeView: changeView,
        );
      default:
        return YearView(
          date: date,
          setBackButton: setBackButton,
          changeView: changeView,
        );
    }
  }

  static List<CalendarView> all({
    required MoonDate date,
    void Function(CalendarHeaderBackButton?)? setBackButton,
    void Function({required int viewIndex, required MoonDate date})? changeView,
  }) {
    return _View.values.indexed
        .map(
          (view) => CalendarView(
            view.$1,
            date: date,
            setBackButton: setBackButton,
            changeView: changeView,
          ),
        )
        .toList();
  }

  static List<IconPath> get allIconPaths {
    return _View.values.map((view) => view.iconPath).toList();
  }

  static List<ButtonStackItem<int>> get allAsButtonStackItems {
    return allIconPaths.indexed
        .map((item) => ButtonStackItem(id: item.$1, iconPath: item.$2))
        .toList();
  }
}
