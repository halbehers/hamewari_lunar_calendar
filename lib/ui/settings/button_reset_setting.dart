import 'package:flutter/material.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/settings/button_setting.dart';

class ButtonResetSetting extends StatelessWidget {
  const ButtonResetSetting({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    final t = SettingsLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return ButtonSetting(
      label: label ?? t.reset_button,
      backgroundColor: appTheme.dangerBackgroundColor,
      textStyle: appTheme.dangerBody,
      onTap: () => settingsProvider.resetSettings(),
      withConfirm: ButtonSettingConfirm(
        content: t.reset_button_confirm_content,
        confirmText: t.reset_button_confirm_action,
        cancelText: t.reset_button_confirm_cancel,
      ),
    );
  }
}
