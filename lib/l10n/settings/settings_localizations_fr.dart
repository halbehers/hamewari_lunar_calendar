// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'settings_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class SettingsLocalizationsFr extends SettingsLocalizations {
  SettingsLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get menu_caption => 'Paramètres';

  @override
  String get title => 'Paramètres';

  @override
  String get display => 'Affichage';

  @override
  String get display_menu_caption => 'Afficher les labels du menu';

  @override
  String get language => 'Langue';

  @override
  String get language_system => 'Système';

  @override
  String get theme_mode => 'Thème';

  @override
  String get theme_mode_dark => 'Sombre';

  @override
  String get theme_mode_light => 'Clair';

  @override
  String get theme_mode_system => 'Système';

  @override
  String get calendar => 'Calendrier';

  @override
  String get calendar_type => 'Type';

  @override
  String calendar_types(String dateType) {
    String _temp0 = intl.Intl.selectLogic(dateType, {
      'gregorian': 'Calendrier grégorien',
      'yearZero': 'Calendrier Year Zero',
      'hamewari': 'Calendrier Hamewari',
      'other': 'Calendrier non identifié',
    });
    return '$_temp0';
  }

  @override
  String get effects => 'Effets';

  @override
  String get haptics_enabled => 'Haptiques activée';

  @override
  String get timezone => 'Fuseau horaire';

  @override
  String get timezone_system => 'Système';

  @override
  String get timezone_hint => 'Rechercher un fuseau horaire';

  @override
  String get timezone_no_results => 'Aucun fuseau horaire n\'a été trouvé.';

  @override
  String get default_event_duration => 'Durée par défaut des événements';

  @override
  String default_event_durations(String duration) {
    String _temp0 = intl.Intl.selectLogic(duration, {
      'fifteenMinutes': '15 minutes',
      'twentyMinutes': '20 minutes',
      'thirtyMinutes': '30 minutes',
      'fortyFiveMinutes': '45 minutes',
      'oneHour': '60 minutes',
      'ninetyMinutes': '90 minutes',
      'twoHours': '120 minutes',
      'other': 'Unknown duration',
    });
    return '$_temp0';
  }

  @override
  String get reset_button => 'Réinitialiser les paramètres';

  @override
  String get reset_button_confirm_content =>
      'Êtes-vous sûr de vouloir réinitialiser tous les paramètres ?';

  @override
  String get reset_button_confirm_action => 'Réinitialiser les paramètres';

  @override
  String get reset_button_confirm_cancel => 'Annuler';
}
