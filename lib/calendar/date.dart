import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date_formatter.dart';

class OutOfCalendarDayBounds<T extends Date<T>> {
  final T start;
  final T end;

  OutOfCalendarDayBounds(this.start, this.end) {
    if (start.addDays(1) != end) {
      throw ArgumentError('Out of calendar day bounds must be 1 day apart');
    }
  }
}

abstract class Date<T extends Date<T>> implements Comparable<T> {
  int year = 1971;
  int month = 1;
  int day = 1;
  int hour = 0;
  int minute = 0;

  Date(int year, [int month = 1, int day = 1, int hour = 0, int minute = 0])
    : this._internal(year, month, day, hour, minute);

  T newInstance(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
  ]);

  Date._internal(this.year, this.month, this.day, this.hour, this.minute);

  T get now;

  int get weekday;
  int get weekNumber {
    final firstOfYear = startOfYear();
    final firstWeekday = firstOfYear.weekday; // 1 = Monday, 7 = Sunday

    // Number of days from the first week of the year to this date
    final daysSinceWeekStart = daysUntil(this) + (firstWeekday - 1);

    return (daysSinceWeekStart / numberOfDaysInWeek).floor() + 1;
  }

  int get weekIndexInMonth {
    final firstOfMonth = startOfMonth();
    final firstWeekday = firstOfMonth.weekday; // 1 = Monday, 7 = Sunday

    // Compute days offset from the first week
    final daysSinceWeekStart = (day - 1) + (firstWeekday - 1);

    return (daysSinceWeekStart / numberOfDaysInWeek).floor() + 1;
  }

  int get numberOfMonths;
  int get numberOfDaysInWeek;
  int get numberOfHoursInDay;
  int get numberOfMinutesInHour;

  bool get hasMoonPhaseBasedWeeks => false;
  bool get hasOutOfCalendarDays => false;

  List<OutOfCalendarDayBounds<T>> get outOfCalendarDaysBounds => List.empty();

  bool isLeapYear(int year);

  int numberOfDaysInMonth(int year, int month);
  int numberOfWeeksInMonth(int year, int month) {
    final numberOfDays = numberOfDaysInMonth(year, month);

    return (numberOfDays / numberOfDaysInWeek).ceil();
  }

  DateTime toDateTime() {
    return DateTime(year, month, day, hour, minute);
  }

  T startOfYear() {
    return newInstance(year);
  }

  T endOfYear() {
    return newInstance(
      year,
      numberOfMonths,
      numberOfDaysInMonth(year, numberOfMonths),
    );
  }

  T startOfMonth() {
    return newInstance(year, month);
  }

  T endOfMonth() {
    return newInstance(year, month, numberOfDaysInMonth(year, month));
  }

  T startOfWeek({bool containedInMonth = false}) {
    final int delta =
        weekday - 1; // days to move back to the first day of the week

    if (!containedInMonth) {
      return subtractDays(delta);
    }

    // If we want to stay within the month
    final daysToMonthStart = startOfMonth().daysUntil(this);
    return subtractDays(delta.clamp(0, daysToMonthStart));
  }

  T endOfWeek({bool containedInMonth = false}) {
    final int delta = 7 - weekday;

    if (!containedInMonth) {
      return addDays(delta);
    }

    final daysToMonthEnd = daysUntil(endOfMonth());
    return addDays(delta.clamp(0, daysToMonthEnd));
  }

  T startOfDay() {
    return newInstance(year, month, day);
  }

  T endOfDay() {
    return newInstance(year, month, day, numberOfHoursInDay);
  }

  T startOfHour() {
    return newInstance(year, month, day, hour);
  }

  T endOfHour() {
    return newInstance(year, month, day, hour, numberOfMinutesInHour);
  }

  bool get isCurrentYear => isSameYear(now);
  bool get isCurrentMonth => isSameMonth(now);
  bool get isCurrentWeek => isSameWeek(now);
  bool get isToday => isSameDay(now);
  bool get isCurrentHour => isSameHour(now);
  bool get isCurrentMinute => isSameMinute(now);

  bool isSameYear(T other) {
    return year == other.year;
  }

  bool isSameMonth(T other) {
    return startOfMonth() == other.startOfMonth();
  }

  bool isSameWeek(T other, {bool containedInMonth = false}) {
    return startOfWeek(containedInMonth: containedInMonth) ==
        other.startOfWeek(containedInMonth: containedInMonth);
  }

  bool isSameDay(T other) {
    return startOfDay() == other.startOfDay();
  }

  bool isSameHour(T other) {
    return startOfHour() == other.startOfHour();
  }

  bool isSameMinute(T other) {
    return startOfHour() == other.startOfHour() && minute == other.minute;
  }

  List<T> getAllDatesFromWeek({bool containedInMonth = false}) {
    final start = startOfWeek(containedInMonth: containedInMonth);
    final end = endOfWeek(containedInMonth: containedInMonth);

    final int totalDays = start.daysUntil(end) + 1;
    return List.generate(totalDays, (i) => start.addDays(i));
  }

  List<T> getAllStartOfMonthsFromYear() {
    return List.generate(
      numberOfMonths,
      (int index) => newInstance(year, index + 1),
    );
  }

  List<T> getAllStartOfWeeksFromMonth() {
    final List<T> result = [];

    final T monthStart = startOfMonth();

    final int deltaToFirstWeekdayOfMonth = monthStart.weekday - 1;
    T effectiveWeekStart = monthStart.subtractDays(deltaToFirstWeekdayOfMonth);

    if (effectiveWeekStart.month != month || effectiveWeekStart.year != year) {
      result.add(monthStart);
    }

    T current = effectiveWeekStart;

    while (isSameMonth(current) || withMonth(month - 1).isSameMonth(current)) {
      if (isSameMonth(current)) result.add(current);

      current = current.addDays(numberOfDaysInWeek);
    }

    return result;
  }

  T getDateFromWeekDayIndex(int index) {
    return newInstance(year, month, index + 1);
  }

  T getStartOfMonthDateFromMonthIndex(int index) {
    return newInstance(year, index + 1);
  }

  T withYear(int year) {
    return newInstance(year, month, day, hour, minute);
  }

  T withMonth(int month) {
    int m = month;
    int y = year;
    int d = day;
    if (m < 1) {
      m = numberOfMonths + m;
      y--;
    }
    if (m > numberOfMonths) {
      m = 1 + m % numberOfMonths;
      y++;
    }
    if (d > numberOfDaysInMonth(y, m)) {
      d = numberOfDaysInMonth(y, m);
    }
    return newInstance(y, m, d, hour, minute);
  }

  T withDay(int day) {
    final daysInMonth = numberOfDaysInMonth(year, month);
    if (day < 1) {
      day = daysInMonth;
    }
    if (day > daysInMonth) day = 1;
    return newInstance(year, month, day, hour, minute);
  }

  T withHour(int hour) {
    final hoursInDay = numberOfHoursInDay;
    if (hour < 0) hour = hoursInDay;
    if (hour > hoursInDay) hour = 0;
    return newInstance(year, month, day, hour, minute);
  }

  T withMinute(int minute) {
    final minutesInHour = numberOfMinutesInHour;
    if (minute < 0) minute = minutesInHour;
    if (minute > minutesInHour) minute = 0;
    return newInstance(year, month, day, hour, minute);
  }

  T addMonths(int delta) {
    int y = year;
    int m = month + delta;
    int d = day;

    while (m > numberOfMonths) {
      m -= numberOfMonths;
      y++;
    }

    final daysInNewMonth = numberOfDaysInMonth(y, m);
    if (d > daysInNewMonth) {
      d = daysInNewMonth;
    }

    return newInstance(y, m, d, hour, minute);
  }

  T addWeeks(int delta) {
    int remaining = delta;
    T result = this as T;

    while (remaining > 0) {
      result = result.addDays(numberOfDaysInWeek);
      remaining--;
    }

    return result;
  }

  T addDays(int days) {
    int y = year;
    int m = month;
    int d = day + days;

    while (d > numberOfDaysInMonth(y, m)) {
      d -= numberOfDaysInMonth(y, m);
      m++;
      if (m > numberOfMonths) {
        m = 1;
        y++;
      }
    }

    return newInstance(y, m, d);
  }

  T addHours(int delta) {
    int y = year;
    int m = month;
    int d = day;
    int h = hour;
    int min = minute;

    int remaining = delta;

    while (remaining > 0) {
      if (h < numberOfHoursInDay - 1) {
        h++;
      } else {
        h = 0;
        // move to next day
        final nextDay = newInstance(y, m, d).addDays(1);
        y = nextDay.year;
        m = nextDay.month;
        d = nextDay.day;
      }
      remaining--;
    }

    return newInstance(y, m, d, h, min);
  }

  T addMinutes(int delta) {
    int y = year;
    int m = month;
    int d = day;
    int h = hour;
    int min = minute;

    int remaining = delta;

    while (remaining > 0) {
      if (min < numberOfMinutesInHour - 1) {
        min++;
      } else {
        min = 0;

        // advance hour
        if (h < numberOfHoursInDay - 1) {
          h++;
        } else {
          h = 0;

          // advance day
          final nextDay = newInstance(y, m, d).addDays(1);
          y = nextDay.year;
          m = nextDay.month;
          d = nextDay.day;
        }
      }
      remaining--;
    }

    return newInstance(y, m, d, h, min);
  }

  T subtractMonths(int delta) {
    int y = year;
    int m = month - delta;
    int d = day;

    while (m < 1) {
      m += numberOfMonths;
      y--;
    }

    final daysInNewMonth = numberOfDaysInMonth(y, m);
    if (d > daysInNewMonth) {
      d = daysInNewMonth;
    }

    return newInstance(y, m, d, hour, minute);
  }

  T subtractWeeks(int delta) {
    return subtractDays(delta * numberOfDaysInWeek);
  }

  T subtractDays(int days) {
    int y = year;
    int m = month;
    int d = day;

    int remaining = days;

    while (remaining > 0) {
      if (d > 1) {
        d--;
      } else {
        m--;
        if (m == 0) {
          m = numberOfMonths;
          y--;
        }
        d = numberOfDaysInMonth(y, m);
      }
      remaining--;
    }

    return newInstance(y, m, d);
  }

  T subtractHours(int delta) {
    int y = year;
    int m = month;
    int d = day;
    int h = hour;
    int min = minute;

    int remaining = delta;

    while (remaining > 0) {
      if (h > 0) {
        h--;
      } else {
        h = numberOfHoursInDay - 1;
        // move to previous day
        final prevDay = newInstance(y, m, d).subtractDays(1);
        y = prevDay.year;
        m = prevDay.month;
        d = prevDay.day;
      }
      remaining--;
    }

    return newInstance(y, m, d, h, min);
  }

  T subtractMinutes(int delta) {
    int y = year;
    int m = month;
    int d = day;
    int h = hour;
    int min = minute;

    int remaining = delta;

    while (remaining > 0) {
      if (min > 0) {
        min--;
      } else {
        min = 59;

        // rollback hour
        if (h > 0) {
          h--;
        } else {
          h = numberOfHoursInDay - 1;

          // rollback day
          final prevDay = newInstance(y, m, d).subtractDays(1);
          y = prevDay.year;
          m = prevDay.month;
          d = prevDay.day;
        }
      }
      remaining--;
    }

    return newInstance(y, m, d, h, min);
  }

  int daysUntil(Date other) {
    final a = toDateTime().toUtc();
    final b = other.toDateTime().toUtc();
    return b.difference(a).inDays;
  }

  static bool isDayActive(Date date) {
    return date.isCurrentMonth && date.isCurrentWeek && date.isToday;
  }

  DateFormatter<T> newFormatter(String pattern, Locale? locale);

  String format({
    String pattern = DateFormatter.yearNumMonthDayPattern,
    DateFormatter<T>? format,
    Locale? locale,
  }) {
    return (format ?? newFormatter(pattern, locale)).format(this as T);
  }

  @override
  int compareTo(T other) {
    final yearCompare = year.compareTo(other.year);
    if (yearCompare != 0) return yearCompare;
    final monthCompare = month.compareTo(other.month);
    if (monthCompare != 0) return monthCompare;
    final dayCompare = day.compareTo(other.day);
    if (dayCompare != 0) return dayCompare;
    final hourCompare = hour.compareTo(other.hour);
    if (hourCompare != 0) return hourCompare;

    return minute.compareTo(other.minute);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is T &&
          year == other.year &&
          month == other.month &&
          day == other.day &&
          hour == other.hour &&
          minute == other.minute;

  @override
  int get hashCode => Object.hash(year, month, day, hour, minute);

  @override
  String toString() =>
      '[${T.toString()}] $day/$month/$year ${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}';
}
