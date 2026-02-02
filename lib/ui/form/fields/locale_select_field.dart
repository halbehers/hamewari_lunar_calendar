import 'package:flutter/material.dart';
import 'package:hamewari/l10n/general/general_localizations.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/form/fields/select_field.dart';

class LocaleSelectField extends StatelessWidget {
  const LocaleSelectField({super.key, this.label});

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

    return SelectField<SettingLocale>(
      label: label ?? t.language,
      initialValue: settingsProvider.settingLocale,
      onValueChanged: settingsProvider.setSettingLocale,
      items: [
        SelectItem(label: t.language_system, value: SettingLocale.empty),
        ...GeneralLocalizations.supportedLocales.map(
          (locale) => SelectItem(
            label: languageByLocale[locale]!,
            value: SettingLocale.of(locale),
          ),
        ),
      ],
    );
  }
}
