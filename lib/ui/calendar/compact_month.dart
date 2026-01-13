import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/compact_week_row.dart';

class CompactMonth extends StatelessWidget {
  const CompactMonth({super.key, required this.month});

  final Month month;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsGeometry.directional(bottom: 12),
          child: Text(month.name, style: appTheme.h5),
        ),
        const CompactWeekRow(week: Week.starting),
        const CompactWeekRow(week: Week.refinement),
        const CompactWeekRow(week: Week.transformation),
        const CompactWeekRow(week: Week.implementation),
      ],
    );
  }
}
