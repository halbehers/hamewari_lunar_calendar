import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/settings/dropdown_setting.dart';
import 'package:provider/provider.dart';

class LocaleSetting extends StatelessWidget {
  const LocaleSetting({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    Map<Locale, String> languageByLocale = {
      Locale("en"): t.language_en,
      Locale("fr"): t.language_fr,
      Locale("es"): t.language_es,
    };

    return DropdownSetting<Locale>(
      label: label ?? t.settings_language,
      initialValue: settingsProvider.locale,
      onChanged: settingsProvider.setLocale,
      notSelectedLabel: t.settings_language_system,
      items: AppLocalizations.supportedLocales
          .map(
            (locale) => DropdownSettingItem(
              label: languageByLocale[locale]!,
              value: locale,
            ),
          )
          .toList(),
    );
  }
}
