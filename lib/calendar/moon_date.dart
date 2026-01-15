import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date_formatting.dart';
import 'package:hamewari/theme/app_theme.dart';

enum Month {
  magnetic(1),
  lunar(2),
  electric(3),
  selfExisting(4),
  harmonic(5),
  rhythmic(6),
  resonant(7),
  galactic(8),
  solar(9),
  planetary(10),
  spectral(11),
  crystal(12),
  cosmic(13);

  const Month(this.monthNumber);

  final int monthNumber;
}

enum Week {
  starting(1),
  refinement(2),
  transformation(3),
  implementation(4);

  const Week(this.weekNumber);

  final int weekNumber;

  Color getWeekBackgroundColor(AppTheme appTheme) {
    final Map<int, Color> backgroundColors = {
      1: appTheme.startingWeekBackgroundColor,
      2: appTheme.refinementWeekBackgroundColor,
      3: appTheme.transformationWeekBackgroundColor,
      4: appTheme.implementationWeekBackgroundColor,
    };
    return backgroundColors[weekNumber]!;
  }
}

enum Day {
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  sunday(7);

  const Day(this.dayNumber);

  final int dayNumber;
}

class MoonDate implements Comparable<MoonDate> {
  MoonDate(
    int year, [
    Month month = Month.magnetic,
    Week week = Week.starting,
    Day day = Day.monday,
  ]) : this._internal(year, month, week, day);

  MoonDate._internal(this.year, this.month, this.week, this.day);

  final int year;
  final Month month;
  final Week week;
  final Day day;
  int get dayNumber => day.dayNumber + ((week.weekNumber - 1) * 7);

  static const double _synodicMonth = 29.530588853;

  @override
  int compareTo(MoonDate other) {
    final yearCompare = year.compareTo(other.year);
    if (yearCompare != 0) return yearCompare;

    final monthCompare = month.index.compareTo(other.month.index);
    if (monthCompare != 0) return monthCompare;

    final weekCompare = week.index.compareTo(other.week.index);
    if (weekCompare != 0) return weekCompare;

    return day.index.compareTo(other.day.index);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoonDate &&
          year == other.year &&
          month.index == other.month.index &&
          week.index == other.week.index &&
          day.index == other.day.index;

  @override
  int get hashCode => Object.hash(year, month.index, week.index, day.index);

  @override
  String toString() =>
      '[MoonDate] year: $year, month: ${month.name} (${month.monthNumber}), week: ${week.name} (${week.weekNumber}), day: ${day.name} ($dayNumber)';

  static DateTime _approximateNewMoonBefore(DateTime dt) {
    // A known reference new moon (e.g., 6 Jan 2000 at 18:14 UT)
    final ref = DateTime.utc(2000, 1, 6, 18, 14);
    final diffDays = dt.difference(ref).inSeconds / 86400.0;
    final cycles = (diffDays / _synodicMonth).floor();
    return ref.add(Duration(seconds: (cycles * _synodicMonth * 86400).round()));
  }

  static DateTime _startOfMoonYear(int gregorianYear) {
    final equinox = DateTime.utc(gregorianYear, 3, 20);
    final before = _approximateNewMoonBefore(equinox);
    final after = before.add(
      Duration(seconds: (_synodicMonth * 86400).round()),
    );

    // Choose whichever is closer to equinox.
    return (after.difference(equinox).abs() < before.difference(equinox).abs())
        ? after
        : before;
  }

  static bool isToday(MoonDate date) => MoonDate.now() == date;
  static bool isCurrentMonth(Month month) => MoonDate.now().month == month;
  static bool isCurrentWeek(Week week) => MoonDate.now().week == week;
  static bool isCurrentDay(Day day) => MoonDate.now().day == day;

  static int get currentYear => MoonDate.now().year;
  static Month get currentMonth => MoonDate.now().month;
  static Week get currentWeek => MoonDate.now().week;
  static Day get currentDay => MoonDate.now().day;

  List<MoonDate> getAllDatesFromWeek() {
    return List.generate(
      7,
      (int index) => MoonDate(year, month, week, Day.values[index]),
    );
  }

  bool isSameDayNumber(int dayNumber) {
    return dayNumber == this.dayNumber;
  }

  static bool isDayActive(MoonDate date) {
    bool isCurrentMonth = MoonDate.isCurrentMonth(date.month);
    bool isCurrentWeek = MoonDate.isCurrentWeek(date.week);

    return isCurrentMonth &&
        isCurrentWeek &&
        date.day.dayNumber % 7 == MoonDate.currentDay.dayNumber;
  }

  factory MoonDate.now() {
    return MoonDate.fromDateTime(DateTime.now());
  }

  factory MoonDate.fromDateTime(DateTime dt) {
    // Start of this moon year (approx)
    final year0 = _startOfMoonYear(dt.year);
    DateTime start;
    int moonYear = dt.year;

    if (dt.isBefore(year0)) {
      // If before the new moon near equinox, use previous
      start = _startOfMoonYear(dt.year - 1);
      moonYear = dt.year - 1;
    } else {
      start = year0;
    }

    final daysSinceStart = dt.difference(start).inSeconds / 86400.0;

    // How many synodic months have passed
    final index = (daysSinceStart / _synodicMonth).floor().clamp(
      0,
      Month.values.length - 1,
    );

    final mMonth = Month.values[index];
    final daysIntoMonth = (daysSinceStart - index * _synodicMonth).floor();

    final w = (daysIntoMonth / 7).floor().clamp(0, 3);
    final d = (daysIntoMonth % 7).clamp(0, 6);

    return MoonDate(moonYear, mMonth, Week.values[w], Day.values[d]);
  }

  /// Convert back to a DateTime approximate
  DateTime toDateTime() {
    final start = _startOfMoonYear(year);
    final int monthIndex = month.index;
    final int daysOffset = (monthIndex * _synodicMonth).round();
    final int weekDays = week.weekNumber * 7;
    return start.add(Duration(days: daysOffset + weekDays + day.dayNumber));
  }

  /// Returns how many days difference to another MoonDate
  int daysUntil(MoonDate other) {
    final a = toDateTime().toUtc();
    final b = other.toDateTime().toUtc();
    return b.difference(a).inDays;
  }
}
