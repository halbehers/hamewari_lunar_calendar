import 'package:flutter/material.dart';
import 'package:hamewari/db/models/event.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/event_card.dart';

class DetailedDay extends StatelessWidget {
  const DetailedDay({
    super.key,
    required this.day,
    this.isActive = false,
    this.events,
  });

  final int day;
  final bool isActive;
  final List<Event>? events;

  List<Event> getEvents() {
    if (events == null) return List.empty();

    events!.sort((a, b) => a.startingAt.compareTo(b.startingAt));

    return events!;
  }

  Widget buildDayNumber(AppTheme appTheme) {
    return Container(
      width: 32,
      height: 24,
      decoration: isActive
          ? BoxDecoration(
              color: appTheme.accentBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(1000)),
            )
          : null,
      child: Center(child: Text(day.toString(), style: appTheme.body)),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 2),
      child: Column(
        children: [
          buildDayNumber(appTheme),
          ...getEvents().map((event) {
            return EventCard(event: event);
          }),
        ],
      ),
    );
  }
}
