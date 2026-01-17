import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/year/compact_week_row.dart';

class CompactMonth extends StatelessWidget {
  const CompactMonth({super.key, required this.date, this.changeView});

  final MoonDate date;
  final Function({required int viewIndex, required MoonDate date})? changeView;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    AppLocalizations t = AppLocalizations.of(context)!;
    bool isCurrentMonth =
        MoonDate.isCurrentMonth(date.month) &&
        MoonDate.isCurrentYear(date.year);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () =>
              changeView?.call(viewIndex: CalendarView.monthView, date: date),
          child: Padding(
            padding: const EdgeInsetsGeometry.directional(bottom: 12),
            child: Text(
              t.monthTitle(date.month.name),
              style: isCurrentMonth ? appTheme.accentH5 : appTheme.h5,
            ),
          ),
        ),
        ...Week.values.map(
          (week) => CompactWeekRow(
            date: date.startOfWeek(weekOverride: week),
            changeView: changeView,
          ),
        ),
      ],
    );
  }
}
