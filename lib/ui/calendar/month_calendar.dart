import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/detailed_week_row.dart';

class MonthCalendar extends StatelessWidget {
  const MonthCalendar({super.key, required this.month});

  final Month month;

  Widget buildSeparator(AppTheme appTheme) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(bottom: 8),
      child: Container(
        height: 1,
        decoration: BoxDecoration(color: appTheme.borderColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    AppLocalizations t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 0,
          child: Padding(
            padding: const EdgeInsetsGeometry.directional(bottom: 32),
            child: Text(t.month(month.name), style: appTheme.h2),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsetsGeometry.only(bottom: 90),
            child: Column(
              children: [
                Flexible(
                  child: DetailedWeekRow(month: month, week: Week.starting),
                ),
                buildSeparator(appTheme),
                Flexible(
                  child: DetailedWeekRow(month: month, week: Week.refinement),
                ),
                buildSeparator(appTheme),
                Flexible(
                  child: DetailedWeekRow(
                    month: month,
                    week: Week.transformation,
                  ),
                ),
                buildSeparator(appTheme),
                Flexible(
                  child: DetailedWeekRow(
                    month: month,
                    week: Week.implementation,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
