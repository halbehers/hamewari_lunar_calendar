import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/l10n/app_localizations.dart';

extension MoonMonthKey on Month {
  String get l10nKey => name;
}

extension MoonWeekKey on Week {
  String get l10nKey => name;
}

extension MoonDayKey on Day {
  String get l10nKey => name;
}

class MoonDateFormat {
  MoonDateFormat(String formatPattern)
    : this._internal(formatPattern: formatPattern);

  MoonDateFormat._internal({this.formatPattern = "yMd"});

  final String formatPattern;

  static const String dayPattern = 'D';
  static const String weekdayPattern = 'EEE';
  static const String standaloneWeekdayPattern = 'EEEE';
  static const String numWeekPattern = 'W';
  static const String weekPattern = 'WWW';
  static const String standaloneWeekPattern = 'WWWW';
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

  static MoonDateFormat day() => MoonDateFormat(dayPattern);
  static MoonDateFormat weekday() => MoonDateFormat(weekdayPattern);
  static MoonDateFormat weekdayTitle() =>
      MoonDateFormat(standaloneWeekdayPattern);
  static MoonDateFormat numWeek() => MoonDateFormat(numWeekPattern);
  static MoonDateFormat week() => MoonDateFormat(weekPattern);
  static MoonDateFormat weekTitle() => MoonDateFormat(standaloneWeekPattern);
  static MoonDateFormat numMonth() => MoonDateFormat(numMonthPattern);
  static MoonDateFormat numMonthDay() => MoonDateFormat(numMonthDayPattern);
  static MoonDateFormat numMonthWeekdayDay() =>
      MoonDateFormat(numMonthWeekdayDayPattern);
  static MoonDateFormat month() => MoonDateFormat(monthPattern);
  static MoonDateFormat monthTitle() => MoonDateFormat(standaloneMonthPattern);
  static MoonDateFormat monthDay() => MoonDateFormat(monthDayPattern);
  static MoonDateFormat monthWeekdayDay() =>
      MoonDateFormat(monthWeekdayDayPattern);
  static MoonDateFormat year() => MoonDateFormat(yearPattern);
  static MoonDateFormat yearNumMonth() => MoonDateFormat(yearNumMonthPattern);
  static MoonDateFormat yearNumMonthDay() =>
      MoonDateFormat(yearNumMonthDayPattern);
  static MoonDateFormat yearNumMonthWeekdayDay() =>
      MoonDateFormat(yearNumMonthWeekdayDayPattern);
  static MoonDateFormat yearMonth() => MoonDateFormat(yearMonthPattern);
  static MoonDateFormat yearMonthDay() => MoonDateFormat(yearMonthDayPattern);
  static MoonDateFormat yearMonthWeekdayDay() =>
      MoonDateFormat(yearMonthWeekdayDayPattern);

  Map<String, String> formattedPatternsByPatternsUS = {
    dayPattern: dayPattern,
    weekdayPattern: weekdayPattern,
    standaloneWeekdayPattern: standaloneWeekdayPattern,
    numWeekPattern: numWeekPattern,
    weekPattern: weekPattern,
    standaloneWeekPattern: standaloneWeekPattern,
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
    weekPattern: weekPattern,
    standaloneWeekPattern: standaloneWeekPattern,
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

  String format(BuildContext context, MoonDate date, {Locale? locale}) {
    final t = AppLocalizations.of(context)!;
    Locale autoLocale = locale ?? Localizations.localeOf(context);
    final replacements = <String, String>{
      'Y': date.year.toString(),
      'M': (date.month.monthNumber).toString(),
      'MMM': t.moon_month(date.month.monthNumber.toString()),
      'MMMM': t.moon_month_title(date.month.monthNumber.toString()),
      'W': (date.week.weekNumber).toString(),
      'WWW': t.moon_week(date.week.weekNumber.toString()),
      'WWWW': t.moon_week_title(date.week.weekNumber.toString()),
      'EEE': t.moon_day(date.day.dayNumber.toString()),
      'EEEE': t.moon_day_title(date.day.dayNumber.toString()),
      'D': (date.dayNumber).toString(),
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

extension MoonDateFormatting on MoonDate {
  String format(
    BuildContext context, {
    String pattern = MoonDateFormat.yearNumMonthDayPattern,
    MoonDateFormat? format,
  }) {
    return (format ?? MoonDateFormat(pattern)).format(context, this);
  }
}
