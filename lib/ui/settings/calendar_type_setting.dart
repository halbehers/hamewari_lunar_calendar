import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date_factory.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/settings/dropdown_setting.dart';

class CalendarTypeSetting extends StatelessWidget {
  const CalendarTypeSetting({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final t = SettingsLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return DropdownSetting<DateType>(
      label: label ?? t.settings_calendar_type,
      initialValue: settingsProvider.calendar,
      onChanged: settingsProvider.setCalendar,
      items: DateType.values
          .map(
            (type) => DropdownSettingItem(
              label: t.settings_calendar_types(type.name),
              value: type,
            ),
          )
          .toList(),
    );
  }
}
