import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/providers/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/year/compact_week_row.dart';

class CompactMonth extends StatelessWidget {
  const CompactMonth({
    super.key,
    required this.date,
    this.onDayTap,
    this.displayMonthName = true,
    this.highlightToday = true,
    this.highlightInitialDate = false,
    this.verticalGap = 0.0,
  });

  final Date<dynamic> date;
  final void Function(Date<dynamic> selectedDate)? onDayTap;
  final bool displayMonthName;
  final bool highlightToday;
  final bool highlightInitialDate;
  final double verticalGap;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    late final CalendarProvider? calendarProvider;
    try {
      calendarProvider = CalendarProvider.of(context);
    } catch (_) {
      calendarProvider = null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: verticalGap,
      children: [
        if (displayMonthName)
          GestureDetector(
            onTap: () => calendarProvider?.selectView(
              viewIndex: CalendarViewFactory.monthViewIndex,
              date: date,
            ),
            child: Padding(
              padding: const EdgeInsetsGeometry.directional(bottom: 12),
              child: Text(
                date.format(
                  pattern: DateFormatter.standaloneMonthPattern,
                  locale: Localizations.localeOf(context),
                ),
                style: date.isCurrentMonth
                    ? appTheme.accentH5
                    : appTheme.subduedH5,
              ),
            ),
          ),
        ...date.getAllStartOfWeeksFromMonth().map(
          (startOfWeek) => CompactWeekRow(
            startOfWeek: startOfWeek,
            onDayTap: onDayTap,
            initialDate: date,
            highlightToday: highlightToday,
            highlightInitialDate: highlightInitialDate,
          ),
        ),
      ],
    );
  }
}
