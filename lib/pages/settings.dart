import 'package:flutter/material.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/ui/form/fields/switch_field.dart';
import 'package:hamewari/ui/settings/reset_setting_button.dart';
import 'package:hamewari/ui/form/fields/calendar_type_select_field.dart';
import 'package:hamewari/ui/form/fields/default_event_duration_select_field.dart';
import 'package:hamewari/ui/form/fields/timezone_field.dart';
import 'package:hamewari/ui/form/fields/locale_select_field.dart';
import 'package:hamewari/ui/settings/setting_section.dart';
import 'package:hamewari/ui/form/fields/theme_mode_toggle_switch_field.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final t = SettingsLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Text(t.title, style: appTheme.h1),
        ),
        backgroundColor: appTheme.backgroundColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.fromSTEB(32, 16, 32, 86),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingSection(
              title: t.display,
              items: [
                const ThemeModeToggleSwitchField(),
                SwitchField(
                  label: t.display_menu_caption,
                  initialValue: settingsProvider.displayMenuCaptions,
                  onValueChanged: settingsProvider.setDisplayMenuCaptions,
                ),
                const LocaleSelectField(),
              ],
            ),
            SettingSection(
              title: t.calendar,
              items: [
                const CalendarTypeSelectField(),
                const TimezoneField(),
                const DefaultEventDurationSelectField(),
              ],
            ),
            SettingSection(
              title: t.effects,
              items: [
                SwitchField(
                  label: t.haptics_enabled,
                  initialValue: settingsProvider.hapticEnabled,
                  onValueChanged: settingsProvider.setHapticEnabled,
                ),
              ],
            ),
            const ResetSettingButton(),
            // TODO: About
          ],
        ),
      ),
      floatingActionButton: const MainPageSelector(pageId: "settings"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
