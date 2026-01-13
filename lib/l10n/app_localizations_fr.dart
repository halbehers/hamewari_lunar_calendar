// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get language_en => 'Anglais';

  @override
  String get language_fr => 'Français';

  @override
  String get language_es => 'Espagnol';

  @override
  String get menuCaption_calendar => 'Calendrier';

  @override
  String get menuCaption_tasks => 'Tâches';

  @override
  String get menuCaption_settings => 'Paramètres';

  @override
  String get settings_title => 'Paramètres';

  @override
  String get settings_display => 'Affichage';

  @override
  String get settings_display_menu_caption => 'Afficher les labels du menu';

  @override
  String get settings_language => 'Langue';

  @override
  String get settings_theme_mode => 'Thème';

  @override
  String get theme_mode_dark => 'Sombre';

  @override
  String get theme_mode_light => 'Clair';

  @override
  String get theme_mode_system => 'Système';
}
