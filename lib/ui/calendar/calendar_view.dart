import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/date_factory.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/buttons/today_button.dart';
import 'package:hamewari/providers/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';

abstract class CalendarView extends StatelessWidget
    implements CalendarViewFactory {
  const CalendarView({super.key, required this.date});

  final Date<dynamic> date;

  Widget buildView(BuildContext context);

  EdgeInsetsGeometry get padding {
    return const EdgeInsetsGeometry.symmetric(horizontal: 32.0);
  }

  bool get displayTodayButton => true;

  @override
  Widget build(BuildContext context) {
    final calendarProvider = CalendarProvider.of(context);
    final settingsProvider = SettingsProvider.of(context);

    return Stack(
      children: [
        Padding(padding: padding, child: buildView(context)),
        if (displayTodayButton)
          Positioned(
            bottom: 101,
            right: 32,
            child: TodayButton(
              onTap: () => calendarProvider.selectView(
                viewIndex: CalendarViewFactory.weekViewIndex,
                date: DateFactory.buildNow(
                  settingsProvider.calendar,
                  settingsProvider.timezone,
                ),
              ),
            ),
          ),
      ],
    );
  }

  static const IconPath iconPath = IconPath.largeGrid;
}
