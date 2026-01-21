import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/calendar/year_zero/year_zero_date.dart';
import 'package:hamewari/l10n/app_localizations.dart';

class YearZeroDateFormatter extends DateFormatter<YearZeroDate> {
  YearZeroDateFormatter(super.formatPattern, super.locale);

  @override
  String translateMonth(Locale locale, int month) {
    final t = lookupAppLocalizations(locale);

    return t.moon_month(month.toString());
  }

  @override
  String translateMonthTitle(Locale locale, int month) {
    final t = lookupAppLocalizations(locale);

    return t.moon_month_title(month.toString());
  }

  @override
  String translateWeekday(Locale locale, int weekday) {
    final t = lookupAppLocalizations(locale);

    return t.moon_day(weekday.toString());
  }

  @override
  String translateWeekdayTitle(Locale locale, int weekday) {
    final t = lookupAppLocalizations(locale);

    return t.moon_day_title(weekday.toString());
  }
}
