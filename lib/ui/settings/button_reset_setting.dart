import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
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
    final t = AppLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return ButtonSetting(
      label: label ?? t.settings_reset_button,
      backgroundColor: appTheme.dangerBackgroundColor,
      textStyle: appTheme.dangerBody,
      onTap: () => settingsProvider.resetSettings(),
      withConfirm: ButtonSettingConfirm(
        content: t.settings_reset_button_confirm_content,
        confirmText: t.settings_reset_button_confirm_action,
        cancelText: t.settings_reset_button_confirm_cancel,
      ),
    );
  }
}
