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

    return SizedBox(
      width: 20,
      height: 24,
      child: Center(
        child: Text(day.toString(), style: appTheme.smallText,),
      ),
    );
  }
}
