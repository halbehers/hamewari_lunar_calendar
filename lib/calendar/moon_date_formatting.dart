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
  static const String weekdayPattern = 'E';
  static const String standaloneMonthPattern = 'LLLL';
  static const String numMonthPattern = 'M';
  static const String numMonthDayPattern = 'MD';
  static const String numMonthWeekdayDayPattern = 'MED';
  static const String monthPattern = 'MMMM';
  static const String monthDayPattern = 'MMMMD';
  static const String monthWeekdayDayPattern = 'MMMMED';
  static const String yearPattern = 'Y';
  static const String yearNumMonthPattern = 'YM';
  static const String yearNumMonthDayPattern = 'YMD';
  static const String yearNumMonthWeekdayDayPattern = 'YMED';
  static const String yearMonthPattern = 'YMMMM';
  static const String yearMonthDayPattern = 'YMMMMD';
  static const String yearMonthWeekdayDayPattern = 'YMMMMED';

  static MoonDateFormat day() => MoonDateFormat(dayPattern);
  static MoonDateFormat weekday() => MoonDateFormat(weekdayPattern);
  static MoonDateFormat standaloneMonth() =>
      MoonDateFormat(standaloneMonthPattern);
  static MoonDateFormat numMonth() => MoonDateFormat(numMonthPattern);
  static MoonDateFormat numMonthDay() => MoonDateFormat(numMonthDayPattern);
  static MoonDateFormat numMonthWeekdayDay() =>
      MoonDateFormat(numMonthWeekdayDayPattern);
  static MoonDateFormat month() => MoonDateFormat(monthPattern);
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
    standaloneMonthPattern: standaloneMonthPattern,
    numMonthPattern: numMonthPattern,
    numMonthDayPattern: "M/D",
    numMonthWeekdayDayPattern: "E, M/D",
    monthPattern: monthPattern,
    monthDayPattern: "MMMM D",
    monthWeekdayDayPattern: "E, MMMM D",
    yearPattern: yearPattern,
    yearNumMonthPattern: "M/Y",
    yearNumMonthDayPattern: "M/D/Y",
    yearNumMonthWeekdayDayPattern: "E, M/D/Y",
    yearMonthPattern: "MMMM Y",
    yearMonthDayPattern: "MMMM D, Y",
    yearMonthWeekdayDayPattern: "E, MMMM D, Y",
  };

  Map<String, String> formattedPatternsByPatternsEU = {
    dayPattern: dayPattern,
    weekdayPattern: weekdayPattern,
    standaloneMonthPattern: standaloneMonthPattern,
    numMonthPattern: numMonthPattern,
    numMonthDayPattern: "D/M",
    numMonthWeekdayDayPattern: "E, D/M",
    monthPattern: monthPattern,
    monthDayPattern: "D MMMM",
    monthWeekdayDayPattern: "E D MMMM",
    yearPattern: yearPattern,
    yearNumMonthPattern: "M/Y",
    yearNumMonthDayPattern: "D/M/Y",
    yearNumMonthWeekdayDayPattern: "E, D/M/Y",
    yearMonthPattern: "MMMM Y",
    yearMonthDayPattern: "D MMMM y",
    yearMonthWeekdayDayPattern: "E D MMMM Y",
  };

  String _getFormattedPatternByLocale(String pattern, Locale locale) {
    if (locale.languageCode == "us") {
      return formattedPatternsByPatternsUS[pattern] ?? pattern;
    }
    return formattedPatternsByPatternsEU[pattern] ?? pattern;
  }

  String format(BuildContext context, MoonDate date, {Locale? locale}) {
    final t = AppLocalizations.of(context)!;
    Locale autoLocale = locale ?? Localizations.localeOf(context);
    final replacements = <String, String>{
      'Y': date.year.toString(),

      'M': (date.month.monthNumber).toString(),

      'MMMM': t.month(date.month.l10nKey),

      'W': t.week(date.week.l10nKey),

      'E': t.day(date.day.l10nKey),

      'D': (date.dayNumber).toString(),
    };
    String result = _getFormattedPatternByLocale(formatPattern, autoLocale);

    final sortedKeys = replacements.keys.toList()
      ..sort((a, b) => b.length.compareTo(a.length));

    for (final key in sortedKeys) {
      result = result.replaceAll(key, replacements[key]!);
    }

    return result;
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
