import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/date_formatter.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/providers/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/year/compact_week_row.dart';

class CompactMonth extends StatelessWidget {
  const CompactMonth({super.key, required this.date});

  final Date<dynamic> date;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    final calendarProvider = CalendarProvider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => calendarProvider.selectView(
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
              style: date.isCurrentMonth ? appTheme.accentH5 : appTheme.h5,
            ),
          ),
        ),
        ...date.getAllStartOfWeeksFromMonth().map(
          (startOfWeek) => CompactWeekRow(startOfWeek: startOfWeek),
        ),
      ],
    );
  }
}
