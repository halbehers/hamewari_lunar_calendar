import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/db/models/event.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/providers/calendar_provider.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/calendar/day_number.dart';
import 'package:hamewari/ui/calendar/month/event_card.dart';

const double _dayNumberSize = 32.0;

class DetailedDay extends StatelessWidget {
  const DetailedDay({
    super.key,
    required this.date,
    this.isActive = false,
    this.events,
    this.visibility = DayVisibility.visible,
  });

  final Date<dynamic> date;
  final bool isActive;
  final List<Event>? events;
  final DayVisibility visibility;

  List<Event> getEvents() {
    if (events == null) return List.empty();

    events!.sort((a, b) => a.startingAt.compareTo(b.startingAt));

    return events!;
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    final calendarProvider = CalendarProvider.of(context);

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 2),
      child: visibility == DayVisibility.hidden
          ? SizedBox.fromSize(size: const Size.square(_dayNumberSize))
          : Column(
              children: [
                DayNumber(
                  day: date.day,
                  isActive: isActive,
                  size: _dayNumberSize,
                  textStyle: appTheme.body,
                  activeTextStyle: appTheme.invertedBoldBody,
                  onTap: () => calendarProvider.selectView(
                    viewIndex: CalendarViewFactory.weekViewIndex,
                    date: date,
                  ),
                ),
                ...getEvents().map((event) {
                  return EventCard(event: event);
                }),
              ],
            ),
    );
  }
}
