import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date_factory.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/providers/settings_provider.dart';

class TimeIndicator extends StatelessWidget {
  const TimeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final settingsProvider = SettingsProvider.of(context);

    final now = DateFactory.buildNow(
      settingsProvider.calendar,
      settingsProvider.timezone,
    );

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
            style: appTheme.invertedBoldSmallText,
          ),
        ),
        Expanded(child: Container(height: 2, color: appTheme.accentColor)),
      ],
    );
  }
}
