import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/buttons/button_stack.dart';
import 'package:hamewari/ui/calendar/month/month.dart';
import 'package:hamewari/ui/calendar/week/week.dart';
import 'package:hamewari/ui/calendar/year/year.dart';

enum _View {
  year(YearView.iconPath),
  month(MonthView.iconPath),
  week(WeekView.iconPath);

  const _View(this.iconPath);

  final IconPath iconPath;
}

abstract class CalendarViewFactory extends Widget {
  static const int yearViewIndex = 0;
  static const int monthViewIndex = 1;
  static const int weekViewIndex = 2;

  factory CalendarViewFactory(int index, {required Date<dynamic> date}) {
    switch (index) {
      case yearViewIndex:
        return YearView(date: date);
      case monthViewIndex:
        return MonthView(date: date);
      case weekViewIndex:
        return WeekView(date: date);
      default:
        return YearView(date: date);
    }
  }

  static List<CalendarViewFactory> all({required Date<dynamic> date}) {
    return _View.values.indexed
        .map((view) => CalendarViewFactory(view.$1, date: date))
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
