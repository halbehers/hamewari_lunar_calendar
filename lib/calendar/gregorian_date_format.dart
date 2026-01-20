import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/calendar/gregorian_date.dart';
import 'package:hamewari/l10n/app_localizations.dart';

class GregorianDateFormat extends DateFormatter<GregorianDate> {
  GregorianDateFormat(super.formatPattern);

  @override
  String translateMonth(BuildContext context, int month) {
    final t = AppLocalizations.of(context)!;
    return t.gregorian_month(month.toString());
  }

  @override
  String translateMonthTitle(BuildContext context, int month) {
    final t = AppLocalizations.of(context)!;
    return t.gregorian_month_title(month.toString());
  }

  @override
  String translateWeekday(BuildContext context, int weekday) {
    final t = AppLocalizations.of(context)!;
    return t.gregorian_day(weekday.toString());
  }

  @override
  String translateWeekdayTitle(BuildContext context, int weekday) {
    final t = AppLocalizations.of(context)!;
    return t.gregorian_day_title(weekday.toString());
  }
}
