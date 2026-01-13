import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/theme/h_icon.dart';
import 'package:hamewari/theme/icon_path.dart';

class LocaleSetting extends StatelessWidget {
  const LocaleSetting({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  final String label;
  final Locale initialValue;
  final void Function(Locale?)? onChanged;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    AppLocalizations t = AppLocalizations.of(context)!;
    Map<Locale, String> languageByLocale = {
      Locale("en"): t.language_en,
      Locale("fr"): t.language_fr,
      Locale("es"): t.language_es,
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: appTheme.body),
        DropdownButton<Locale>(
          value: initialValue,
          icon: HIcon(iconPath: IconPath.arrowBottom),
          underline: Container(height: 2, color: appTheme.borderColor),
          items: AppLocalizations.supportedLocales
              .map(
                (locale) => DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(languageByLocale[locale]!, style: appTheme.body),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
