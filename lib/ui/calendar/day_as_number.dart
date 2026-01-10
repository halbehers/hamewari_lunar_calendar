import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

class DayAsNumber extends StatelessWidget {
  const DayAsNumber({super.key, required this.day, this.isActive = false});

  final int day;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Container(
      width: 20,
      height: 20,
      decoration: isActive
          ? BoxDecoration(
              color: appTheme.accentBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(1000)),
            )
          : null,
      child: Center(child: Text(day.toString(), style: appTheme.smallText)),
    );
  }
}
