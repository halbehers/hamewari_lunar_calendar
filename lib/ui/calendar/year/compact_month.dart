import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_context.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/year/compact_week_row.dart';
import 'package:provider/provider.dart';

class CompactMonth extends StatelessWidget {
  const CompactMonth({super.key, required this.date});

  final MoonDate date;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    AppLocalizations t = AppLocalizations.of(context)!;
    final CalendarController calendar = Provider.of<CalendarController>(
      context,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => calendar.selectView(
            viewIndex: CalendarViewFactory.monthViewIndex,
            date: date,
          ),
          child: Padding(
            padding: const EdgeInsetsGeometry.directional(bottom: 12),
            child: Text(
              t.moon_month_title(date.month.monthNumber.toString()),
              style: MoonDate.isCurrentMonth(date.month)
                  ? appTheme.accentH5
                  : appTheme.h5,
            ),
          ),
        ),
        ...Week.values.map(
          (week) =>
              CompactWeekRow(startOfWeek: date.startOfWeek(weekOverride: week)),
        ),
      ],
    );
  }
}
