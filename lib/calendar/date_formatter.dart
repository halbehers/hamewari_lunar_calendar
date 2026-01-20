import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';

abstract class DateFormatter<T extends Date<T>> {
  DateFormatter(String formatPattern)
    : this._internal(formatPattern: formatPattern);

  DateFormatter._internal({this.formatPattern = "yMd"});

  final String formatPattern;

  static const String dayPattern = 'D';
  static const String weekdayPattern = 'EEE';
  static const String standaloneWeekdayPattern = 'EEEE';
  static const String numWeekPattern = 'W';
  static const String numMonthPattern = 'M';
  static const String numMonthDayPattern = 'MD';
  static const String numMonthWeekdayDayPattern = 'MEEED';
  static const String monthPattern = 'MMM';
  static const String standaloneMonthPattern = 'MMMM';
  static const String monthDayPattern = 'MMMMD';
  static const String monthWeekdayDayPattern = 'MMMMEEED';
  static const String yearPattern = 'Y';
  static const String yearNumMonthPattern = 'YM';
  static const String yearNumMonthDayPattern = 'YMD';
  static const String yearNumMonthWeekdayDayPattern = 'YMEEED';
  static const String yearMonthPattern = 'YMMMM';
  static const String yearMonthDayPattern = 'YMMMMD';
  static const String yearMonthWeekdayDayPattern = 'YMMMMEEED';

  DateFormatter.day() : this(dayPattern);
  DateFormatter.weekday() : this(weekdayPattern);
  DateFormatter.weekdayTitle() : this(standaloneWeekdayPattern);
  DateFormatter.numWeek() : this(numWeekPattern);
  DateFormatter.numMonth() : this(numMonthPattern);
  DateFormatter.numMonthDay() : this(numMonthDayPattern);
  DateFormatter.numMonthWeekdayDay() : this(numMonthWeekdayDayPattern);
  DateFormatter.month() : this(monthPattern);
  DateFormatter.monthTitle() : this(standaloneMonthPattern);
  DateFormatter.monthDay() : this(monthDayPattern);
  DateFormatter.monthWeekdayDay() : this(monthWeekdayDayPattern);
  DateFormatter.year() : this(yearPattern);
  DateFormatter.yearNumMonth() : this(yearNumMonthPattern);
  DateFormatter.yearNumMonthDay() : this(yearNumMonthDayPattern);
  DateFormatter.yearNumMonthWeekdayDay() : this(yearNumMonthWeekdayDayPattern);
  DateFormatter.yearMonth() : this(yearMonthPattern);
  DateFormatter.yearMonthDay() : this(yearMonthDayPattern);
  DateFormatter.yearMonthWeekdayDay() : this(yearMonthWeekdayDayPattern);

  Map<String, String> formattedPatternsByPatternsUS = {
    dayPattern: dayPattern,
    weekdayPattern: weekdayPattern,
    standaloneWeekdayPattern: standaloneWeekdayPattern,
    numWeekPattern: numWeekPattern,
    numMonthPattern: numMonthPattern,
    numMonthDayPattern: "M/D",
    numMonthWeekdayDayPattern: "E, M/D",
    monthPattern: monthPattern,
    standaloneMonthPattern: standaloneMonthPattern,
    monthDayPattern: "MMM D",
    monthWeekdayDayPattern: "E, MMM D",
    yearPattern: yearPattern,
    yearNumMonthPattern: "M/Y",
    yearNumMonthDayPattern: "M/D/Y",
    yearNumMonthWeekdayDayPattern: "E, M/D/Y",
    yearMonthPattern: "MMM Y",
    yearMonthDayPattern: "MMM D, Y",
    yearMonthWeekdayDayPattern: "E, MMM D, Y",
  };

  Map<String, String> formattedPatternsByPatternsEU = {
    dayPattern: dayPattern,
    weekdayPattern: weekdayPattern,
    standaloneWeekdayPattern: standaloneWeekdayPattern,
    numWeekPattern: numWeekPattern,
    numMonthPattern: numMonthPattern,
    numMonthDayPattern: "D/M",
    numMonthWeekdayDayPattern: "EEE, D/M",
    monthPattern: monthPattern,
    standaloneMonthPattern: standaloneMonthPattern,
    monthDayPattern: "D MMM",
    monthWeekdayDayPattern: "EEE D MMM",
    yearPattern: yearPattern,
    yearNumMonthPattern: "M/Y",
    yearNumMonthDayPattern: "D/M/Y",
    yearNumMonthWeekdayDayPattern: "EEE, D/M/Y",
    yearMonthPattern: "MMM Y",
    yearMonthDayPattern: "D MMM y",
    yearMonthWeekdayDayPattern: "EEE D MMM Y",
  };

  String _getFormattedPatternByLocale(String pattern, Locale locale) {
    if (locale.languageCode == "us") {
      return formattedPatternsByPatternsUS[pattern] ?? pattern;
    }
    return formattedPatternsByPatternsEU[pattern] ?? pattern;
  }

  List<String> _parse(String pattern, List<String> sortedKeys) {
    final List<String> parts = [];
    int index = 0;

    while (index < pattern.length) {
      String? matchedKey;

      // Try to match the longest possible key at this position
      for (final key in sortedKeys) {
        if (pattern.startsWith(key, index)) {
          matchedKey = key;
          break;
        }
      }

      if (matchedKey != null) {
        // Found a formatting token
        parts.add(matchedKey);
        index += matchedKey.length;
      } else {
        // Collect raw text until we hit a formatting token
        final buffer = StringBuffer();

        while (index < pattern.length) {
          bool startsWithToken = false;

          for (final key in sortedKeys) {
            if (pattern.startsWith(key, index)) {
              startsWithToken = true;
              break;
            }
          }

          if (startsWithToken) break;

          buffer.write(pattern[index]);
          index++;
        }

        parts.add(buffer.toString());
      }
    }

    return parts;
  }

  String translateMonth(BuildContext context, int month);
  String translateMonthTitle(BuildContext context, int month);
  String translateWeekday(BuildContext context, int weekday);
  String translateWeekdayTitle(BuildContext context, int month);

  String format(BuildContext context, T date, {Locale? locale}) {
    Locale autoLocale = locale ?? Localizations.localeOf(context);
    final replacements = <String, String>{
      'Y': date.year.toString(),
      'M': (date.month).toString(),
      'MMM': translateMonth(context, date.month),
      'MMMM': translateMonthTitle(context, date.month),
      'W': date.weekIndexInMonth.toString(),
      'EEE': translateWeekday(context, date.weekday),
      'EEEE': translateWeekdayTitle(context, date.weekday),
      'D': (date.day).toString(),
    };
    String formattedPattern = _getFormattedPatternByLocale(
      formatPattern,
      autoLocale,
    );
    final sortedKeys = replacements.keys.toList()
      ..sort((a, b) => b.length.compareTo(a.length));

    List<String> tokens = _parse(formattedPattern, sortedKeys);

    return tokens.map((token) {
      if (!sortedKeys.contains(token)) return token;

      return token.replaceFirst(token, replacements[token]!);
    }).join();
  }
}
