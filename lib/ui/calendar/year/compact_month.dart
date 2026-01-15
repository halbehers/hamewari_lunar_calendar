import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/year/compact_week_row.dart';

class CompactMonth extends StatelessWidget {
  const CompactMonth({super.key, required this.month});

  final Month month;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    AppLocalizations t = AppLocalizations.of(context)!;
    bool isCurrentMonth = MoonDate.isCurrentMonth(month);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.directional(bottom: 12),
          child: Text(
            t.monthTitle(month.name),
            style: isCurrentMonth ? appTheme.accentH5 : appTheme.h5,
          ),
        ),
        CompactWeekRow(month: month, week: Week.starting),
        CompactWeekRow(month: month, week: Week.refinement),
        CompactWeekRow(month: month, week: Week.transformation),
        CompactWeekRow(month: month, week: Week.implementation),
      ],
    );
  }
}
