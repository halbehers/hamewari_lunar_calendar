import 'package:flutter/material.dart';
import 'package:hamewari/helpers/string_extension.dart';
import 'package:intl/intl.dart';
import 'package:hamewari/calendar/date.dart';

abstract class DateFormatter<T extends Date<T>> {
  DateFormatter(String formatPattern, [Locale? locale])
    : this._internal(formatPattern: formatPattern, locale: locale);

  DateFormatter._internal({this.locale, this.formatPattern = "yMd"});

  final Locale? locale;
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

  DateFormatter.day(Locale? locale) : this(dayPattern, locale);
  DateFormatter.weekday(Locale? locale) : this(weekdayPattern, locale);
  DateFormatter.weekdayTitle(Locale? locale)
    : this(standaloneWeekdayPattern, locale);
  DateFormatter.numWeek(Locale? locale) : this(numWeekPattern, locale);
  DateFormatter.numMonth(Locale? locale) : this(numMonthPattern, locale);
  DateFormatter.numMonthDay(Locale? locale) : this(numMonthDayPattern, locale);
  DateFormatter.numMonthWeekdayDay(Locale? locale)
    : this(numMonthWeekdayDayPattern, locale);
  DateFormatter.month(Locale? locale) : this(monthPattern, locale);
  DateFormatter.monthTitle(Locale? locale)
    : this(standaloneMonthPattern, locale);
  DateFormatter.monthDay(Locale? locale) : this(monthDayPattern, locale);
  DateFormatter.monthWeekdayDay(Locale? locale)
    : this(monthWeekdayDayPattern, locale);
  DateFormatter.year(Locale? locale) : this(yearPattern, locale);
  DateFormatter.yearNumMonth(Locale? locale)
    : this(yearNumMonthPattern, locale);
  DateFormatter.yearNumMonthDay(Locale? locale)
    : this(yearNumMonthDayPattern, locale);
  DateFormatter.yearNumMonthWeekdayDay(Locale? locale)
    : this(yearNumMonthWeekdayDayPattern, locale);
  DateFormatter.yearMonth(Locale? locale) : this(yearMonthPattern, locale);
  DateFormatter.yearMonthDay(Locale? locale)
    : this(yearMonthDayPattern, locale);
  DateFormatter.yearMonthWeekdayDay(Locale? locale)
    : this(yearMonthWeekdayDayPattern, locale);

  Locale get _effectiveLocale => locale ?? Intl.getCurrentLocale().asLocale;

  Map<String, String> formattedPatternsByPatternsUS = {
    dayPattern: dayPattern,
    weekdayPattern: weekdayPattern,
    standaloneWeekdayPattern: standaloneWeekdayPattern,
    numWeekPattern: numWeekPattern,
    numMonthPattern: numMonthPattern,
    numMonthDayPattern: "M/D",
    numMonthWeekdayDayPattern: "EEE, M/D",
    monthPattern: monthPattern,
    standaloneMonthPattern: standaloneMonthPattern,
    monthDayPattern: "MMM D",
    monthWeekdayDayPattern: "EEE, MMM D",
    yearPattern: yearPattern,
    yearNumMonthPattern: "M/Y",
    yearNumMonthDayPattern: "M/D/Y",
    yearNumMonthWeekdayDayPattern: "EEE, M/D/Y",
    yearMonthPattern: "MMM Y",
    yearMonthDayPattern: "MMM D, Y",
    yearMonthWeekdayDayPattern: "EEE, MMM D, Y",
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

  String translateMonth(Locale locale, int month);
  String translateMonthTitle(Locale locale, int month);
  String translateWeekday(Locale locale, int weekday);
  String translateWeekdayTitle(Locale locale, int month);

  String format(T date, {Locale? locale}) {
    Locale effectiveLocale = locale ?? _effectiveLocale;
    final replacements = <String, String>{
      'Y': date.year.toString(),
      'M': (date.month).toString(),
      'MMM': translateMonth(effectiveLocale, date.month),
      'MMMM': translateMonthTitle(effectiveLocale, date.month),
      'W': date.weekIndexInMonth.toString(),
      'EEE': translateWeekday(effectiveLocale, date.weekday),
      'EEEE': translateWeekdayTitle(effectiveLocale, date.weekday),
      'D': (date.day).toString(),
    };
    String formattedPattern = _getFormattedPatternByLocale(
      formatPattern,
      effectiveLocale,
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
