// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get app_name => 'Hamewari Calendrier';

  @override
  String get app_loading => 'Chargement de l\'application...';

  @override
  String get language_en => 'Anglais';

  @override
  String get language_fr => 'Français';

  @override
  String get language_es => 'Espagnol';

  @override
  String get caption_calendar => 'Calendrier';

  @override
  String get caption_tasks => 'Tâches';

  @override
  String get caption_settings => 'Paramètres';

  @override
  String get caption_today => 'Aujourd\'hui';

  @override
  String get settings_title => 'Paramètres';

  @override
  String get settings_display => 'Affichage';

  @override
  String get settings_display_menu_caption => 'Afficher les labels du menu';

  @override
  String get settings_language => 'Langue';

  @override
  String get settings_language_system => 'Système';

  @override
  String get settings_theme_mode => 'Thème';

  @override
  String get theme_mode_dark => 'Sombre';

  @override
  String get theme_mode_light => 'Clair';

  @override
  String get theme_mode_system => 'Système';

  @override
  String get settings_calendar => 'Calendrier';

  @override
  String get settings_calendar_type => 'Type';

  @override
  String settings_calendar_types(String dateType) {
    String _temp0 = intl.Intl.selectLogic(dateType, {
      'gregorian': 'Calendrier grégorien',
      'yearZero': 'Calendrier Year Zero',
      'other': 'Calendrier non identifié',
    });
    return '$_temp0';
  }

  @override
  String moon_month_title(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Lune magnétique',
      '2': 'Lune lunaire',
      '3': 'Lune électrique',
      '4': 'Lune auto-existante',
      '5': 'Lune harmonique',
      '6': 'Lune rythmique',
      '7': 'Lune résonnante',
      '8': 'Lune galactique',
      '9': 'Lune solaire',
      '10': 'Lune planétaire',
      '11': 'Lune spectrale',
      '12': 'Lune de cristal',
      '13': 'Lune cosmique',
      'other': 'Lune non identifiée',
    });
    return '$_temp0';
  }

  @override
  String moon_month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'magnétique',
      '2': 'lunaire',
      '3': 'électrique',
      '4': 'auto-existante',
      '5': 'harmonique',
      '6': 'rythmique',
      '7': 'résonnante',
      '8': 'galactique',
      '9': 'solaire',
      '10': 'planétaire',
      '11': 'spectrale',
      '12': 'cristal',
      '13': 'cosmique',
      'other': 'non identifiée',
    });
    return '$_temp0';
  }

  @override
  String moon_week_title(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      '1': 'Semaine de démarrage',
      '2': 'Semaine de raffinement',
      '3': 'Semaine de transformation',
      '4': 'Semaine de mise en œuvre',
      'other': 'Semaine non identifiée',
    });
    return '$_temp0';
  }

  @override
  String moon_week(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      '1': 'démarrage',
      '2': 'raffinement',
      '3': 'transformation',
      '4': 'mise en œuvre',
      'other': 'non identifiée',
    });
    return '$_temp0';
  }

  @override
  String moon_day_title(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Lundi',
      '2': 'Mardi',
      '3': 'Mercredi',
      '4': 'Jeudi',
      '5': 'Vendredi',
      '6': 'Samedi',
      '7': 'Dimanche',
      'other': 'Jour non identifié',
    });
    return '$_temp0';
  }

  @override
  String moon_day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'lundi',
      '2': 'mardi',
      '3': 'mercredi',
      '4': 'jeudi',
      '5': 'vendredi',
      '6': 'samedi',
      '7': 'dimanche',
      'other': 'non identifié',
    });
    return '$_temp0';
  }

  @override
  String gregorian_month_title(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Janvier',
      '2': 'Février',
      '3': 'Mars',
      '4': 'Avril',
      '5': 'Mai',
      '6': 'Juin',
      '7': 'Juillet',
      '8': 'Août',
      '9': 'Septembre',
      '10': 'Octobre',
      '11': 'Novembre',
      '12': 'Décembre',
      'other': 'Mois non identifié',
    });
    return '$_temp0';
  }

  @override
  String gregorian_month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'janvier',
      '2': 'février',
      '3': 'mars',
      '4': 'avril',
      '5': 'mai',
      '6': 'juin',
      '7': 'juillet',
      '8': 'août',
      '9': 'septembre',
      '10': 'octobre',
      '11': 'novembre',
      '12': 'décembre',
      'other': 'non identifié',
    });
    return '$_temp0';
  }

  @override
  String gregorian_day_title(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Lundi',
      '2': 'Mardi',
      '3': 'Mercredi',
      '4': 'Jeudi',
      '5': 'Vendredi',
      '6': 'Samedi',
      '7': 'Dimanche',
      'other': 'Jour non identifié',
    });
    return '$_temp0';
  }

  @override
  String gregorian_day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'lundi',
      '2': 'mardi',
      '3': 'mercredi',
      '4': 'jeudi',
      '5': 'vendredi',
      '6': 'samedi',
      '7': 'dimanche',
      'other': 'non identifié',
    });
    return '$_temp0';
  }
}
