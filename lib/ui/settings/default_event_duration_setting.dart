import 'package:flutter/material.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/settings/dropdown_setting.dart';

class DefaultEventDurationSetting extends StatelessWidget {
  const DefaultEventDurationSetting({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final t = SettingsLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return DropdownSetting<DefaultEventDuration>(
      label: label ?? t.settings_default_event_duration,
      initialValue: settingsProvider.defaultEventDuration,
      onChanged: settingsProvider.setDefaultEventDuration,
      items: DefaultEventDuration.values
          .map(
            (type) => DropdownSettingItem(
              label: t.settings_default_event_durations(type.name),
              value: type,
            ),
          )
          .toList(),
    );
  }
}
