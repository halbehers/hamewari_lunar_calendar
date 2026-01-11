import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

class Day extends StatelessWidget {
  const Day({
    super.key,
    required this.day,
    this.isActive = false,
    this.hasEvent = false,
  });

  final int day;
  final bool isActive;
  final bool hasEvent;

  Widget buildDot(AppTheme appTheme) {
    return Container(
      width: 2,
      height: 2,
      decoration: BoxDecoration(
        color: appTheme.secondaryAccentColor,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Stack(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: isActive
              ? BoxDecoration(
                  color: appTheme.accentBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                )
              : null,
          child: Center(child: Text(day.toString(), style: appTheme.smallText)),
        ),
        ...(hasEvent
            ? [Positioned(bottom: 0, right: 8, child: buildDot(appTheme))]
            : []),
      ],
    );
  }
}
