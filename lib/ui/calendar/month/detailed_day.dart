import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/db/models/event.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/day_number.dart';
import 'package:hamewari/ui/calendar/month/event_card.dart';

class DetailedDay extends StatelessWidget {
  const DetailedDay({
    super.key,
    required this.date,
    this.isActive = false,
    this.events,
    this.changeView,
  });

  final MoonDate date;
  final bool isActive;
  final List<Event>? events;
  final Function({required int viewIndex, required MoonDate date})? changeView;

  List<Event> getEvents() {
    if (events == null) return List.empty();

    events!.sort((a, b) => a.startingAt.compareTo(b.startingAt));

    return events!;
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 2),
      child: Column(
        children: [
          DayNumber(
            day: date.dayNumber,
            isActive: isActive,
            size: 32,
            textStyle: appTheme.body,
            activeTextStyle: appTheme.invertedBoldBody,
            onTap: () =>
                changeView?.call(viewIndex: CalendarView.weekView, date: date),
          ),
          ...getEvents().map((event) {
            return EventCard(event: event);
          }),
        ],
      ),
    );
  }
}
