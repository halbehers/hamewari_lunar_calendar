import 'package:flutter/material.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/settings/searchable_list_setting.dart';

class TimezoneSetting extends StatelessWidget {
  const TimezoneSetting({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final t = SettingsLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return SearchableListSetting<SettingTimezone>(
      label: label ?? t.settings_timezone,
      initialValue: SearchableListSettingItem(
        label: settingsProvider.timezone.getNameOrElse(
          t.settings_timezone_system,
        ),
        value: settingsProvider.timezone,
      ),
      onChanged: settingsProvider.setTimezone,
      items: [
        SearchableListSettingItem(
          label: t.settings_timezone_system,
          value: SettingTimezone.empty,
        ),
        ...SettingTimezone.all.map(
          (timezone) =>
              SearchableListSettingItem(label: timezone.name!, value: timezone),
        ),
      ],
    );
  }
}
