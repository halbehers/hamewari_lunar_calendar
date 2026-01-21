import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/ui/settings/bool_setting.dart';
import 'package:hamewari/ui/settings/calendar_type_setting.dart';
import 'package:hamewari/ui/settings/locale_setting.dart';
import 'package:hamewari/ui/settings/setting_section.dart';
import 'package:hamewari/ui/settings/theme_mode_setting.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final t = AppLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Text(t.settings_title, style: appTheme.h1),
        ),
        backgroundColor: appTheme.backgroundColor,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingSection(
              title: t.settings_display,
              items: [
                const ThemeModeSetting(),
                BoolSetting(
                  label: t.settings_display_menu_caption,
                  initialValue: settingsProvider.displayMenuCaptions,
                  onChanged: settingsProvider.setDisplayMenuCaptions,
                ),
                const LocaleSetting(),
              ],
            ),
            SettingSection(
              title: t.settings_calendar,
              items: [const CalendarTypeSetting()],
            ),
          ],
        ),
      ),
      floatingActionButton: const MainPageSelector(pageId: "settings"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
