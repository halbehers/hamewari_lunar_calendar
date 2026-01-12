// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get language => 'Français';

  @override
  String get menuCaption_calendar => 'Calendrier';

  @override
  String get menuCaption_tasks => 'Tâches';

  @override
  String get menuCaption_settings => 'Paramètres';

  @override
  String get settings_title => 'Paramètres';

  @override
  String get settings_display_menu_caption => 'Afficher les labels du menu';
}
