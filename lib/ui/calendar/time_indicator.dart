import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

class TimeIndicator extends StatelessWidget {
  const TimeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    final now = DateTime.now();

    return Row(
      children: [
        Container(
          width: 50,
          decoration: BoxDecoration(
            color: appTheme.accentColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            '${(now.hour).toString().padLeft(2, '0')}:${(now.minute).toString().padLeft(2, '0')}',
            textAlign: TextAlign.center,
            style: appTheme.boldSmallText,
          ),
        ),
        Expanded(child: Container(height: 2, color: appTheme.accentColor)),
      ],
    );
  }
}
