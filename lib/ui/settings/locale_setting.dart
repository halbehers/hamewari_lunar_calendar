import 'package:flutter/material.dart';
import 'package:hamewari/l10n/general/general_localizations.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/settings/dropdown_setting.dart';

class LocaleSetting extends StatelessWidget {
  const LocaleSetting({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final t = SettingsLocalizations.of(context)!;
    final gt = GeneralLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);
    final Map<Locale, String> languageByLocale = {
      const Locale("en"): gt.language_en,
      const Locale("fr"): gt.language_fr,
      const Locale("es"): gt.language_es,
    };

    return DropdownSetting<SettingLocale>(
      label: label ?? t.settings_language,
      initialValue: settingsProvider.settingLocale,
      onChanged: settingsProvider.setSettingLocale,
      items: [
        DropdownSettingItem(
          label: t.settings_language_system,
          value: SettingLocale.empty,
        ),
        ...GeneralLocalizations.supportedLocales.map(
          (locale) => DropdownSettingItem(
            label: languageByLocale[locale]!,
            value: SettingLocale.of(locale),
          ),
        ),
      ],
    );
  }
}
