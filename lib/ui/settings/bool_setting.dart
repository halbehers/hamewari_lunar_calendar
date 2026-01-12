import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:provider/provider.dart';

class BoolSetting extends StatelessWidget {
  const BoolSetting({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(t.settings_display_menu_caption, style: appTheme.body),
        Switch(
          // This bool value toggles the switch.
          value: settingsProvider.displayMenuCaptions,
          activeThumbColor: appTheme.secondaryColor,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            settingsProvider.setDisplayMenuCaptions(value);
          },
        ),
      ],
    );
  }
}
