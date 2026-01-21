import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/settings/toggle_switch_setting.dart';

class ThemeModeSetting extends StatelessWidget {
  const ThemeModeSetting({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    Map<ThemeMode, String> labelByThemeModes = {
      ThemeMode.light: t.theme_mode_light,
      ThemeMode.dark: t.theme_mode_dark,
      ThemeMode.system: t.theme_mode_system,
    };

    return ToggleSwitchSetting(
      label: label ?? t.settings_theme_mode,
      initialValue: settingsProvider.themeMode,
      onChanged: settingsProvider.setThemeMode,
      items: ThemeMode.values
          .map(
            (mode) => ToggleSwitchSettingItem(
              label: labelByThemeModes[mode]!,
              value: mode,
            ),
          )
          .toList(),
    );
  }
}
