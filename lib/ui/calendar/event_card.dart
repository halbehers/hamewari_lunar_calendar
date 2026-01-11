import 'package:flutter/material.dart';
import 'package:hamewari/db/models/event.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 2),
      child: Container(
        width: 42,
        decoration: BoxDecoration(
          color: appTheme.implementationWeekColor,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 3),
          child: Text(
            event.name,
            textWidthBasis: TextWidthBasis.parent,
            overflow: TextOverflow.clip,
            maxLines: 1,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
