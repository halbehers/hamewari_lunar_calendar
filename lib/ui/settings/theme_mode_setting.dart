import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/settings/toggle_switch_setting.dart';
import 'package:provider/provider.dart';

class ThemeModeSetting extends StatelessWidget {
  const ThemeModeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    Map<ThemeMode, String> labelByThemeModes = {
      ThemeMode.light: t.theme_mode_light,
      ThemeMode.dark: t.theme_mode_dark,
      ThemeMode.system: t.theme_mode_system,
    };

    return ToggleSwitchSetting(
      label: t.settings_theme_mode,
      initialValue: settingsProvider.themeMode,
      onChanged: settingsProvider.setThemeMode,
      items: ThemeMode.values
          .map(
            (mode) =>
                ToggleSwitchItem(label: labelByThemeModes[mode]!, value: mode),
          )
          .toList(),
    );
  }
}
