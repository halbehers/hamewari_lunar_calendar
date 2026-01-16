import 'package:flutter/material.dart';
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
  factory CalendarView(
    int index, {
    void Function(CalendarHeaderBackButton?)? setBackButton,
  }) {
    switch (index) {
      case 0:
        return YearView(setBackButton: setBackButton);
      case 1:
        return MonthView(setBackButton: setBackButton);
      case 2:
        return WeekView(setBackButton: setBackButton);
      default:
        return YearView(setBackButton: setBackButton);
    }
  }

  static List<CalendarView> all({
    void Function(CalendarHeaderBackButton?)? setBackButton,
  }) {
    return _View.values.indexed
        .map((view) => CalendarView(view.$1, setBackButton: setBackButton))
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
