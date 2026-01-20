import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/calendar/gregorian_date.dart';
import 'package:hamewari/l10n/app_localizations.dart';

class GregorianDateFormat extends DateFormatter<GregorianDate> {
  GregorianDateFormat(super.formatPattern, super.locale);

  @override
  String translateMonth(Locale locale, int month) {
    final t = lookupAppLocalizations(locale);

    return t.gregorian_month(month.toString());
  }

  @override
  String translateMonthTitle(Locale locale, int month) {
    final t = lookupAppLocalizations(locale);

    return t.gregorian_month_title(month.toString());
  }

  @override
  String translateWeekday(Locale locale, int weekday) {
    final t = lookupAppLocalizations(locale);

    return t.gregorian_day(weekday.toString());
  }

  @override
  String translateWeekdayTitle(Locale locale, int weekday) {
    final t = lookupAppLocalizations(locale);

    return t.gregorian_day_title(weekday.toString());
  }
}
