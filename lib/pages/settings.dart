import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/settings/bool_setting.dart';
import 'package:hamewari/ui/settings/locale_setting.dart';
import 'package:hamewari/ui/settings/setting_section.dart';
import 'package:hamewari/ui/settings/theme_mode_setting.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    AppLocalizations t = AppLocalizations.of(context)!;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Text(t.settings_title, style: appTheme.h1),
        ),
        backgroundColor: appTheme.backgroundColor,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingSection(
              title: t.settings_display,
              items: [
                ThemeModeSetting(),
                BoolSetting(
                  label: t.settings_display_menu_caption,
                  initialValue: settingsProvider.displayMenuCaptions,
                  onChanged: settingsProvider.setDisplayMenuCaptions,
                ),
                LocaleSetting(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: MainPageSelector(pageId: "settings"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
