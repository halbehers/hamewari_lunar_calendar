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
  String monthTitle(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'magnetic': 'Lune magnétique',
      'lunar': 'Lune lunaire',
      'electric': 'Lune électrique',
      'selfExisting': 'Lune auto-existante',
      'harmonic': 'Lune harmonique',
      'rhythmic': 'Lune rythmique',
      'resonant': 'Lune résonnante',
      'galactic': 'Lune galactique',
      'solar': 'Lune solaire',
      'planetary': 'Lune planétaire',
      'spectral': 'Lune spectrale',
      'crystal': 'Lune de cristal',
      'cosmic': 'Lune cosmique',
      'other': 'Lune non identifiée',
    });
    return '$_temp0';
  }

  @override
  String month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'magnetic': 'magnétique',
      'lunar': 'lunaire',
      'electric': 'électrique',
      'selfExisting': 'auto-existante',
      'harmonic': 'harmonique',
      'rhythmic': 'rythmique',
      'resonant': 'résonnante',
      'galactic': 'galactique',
      'solar': 'solaire',
      'planetary': 'planétaire',
      'spectral': 'spectrale',
      'crystal': 'cristal',
      'cosmic': 'cosmique',
      'other': 'non identifiée',
    });
    return '$_temp0';
  }

  @override
  String weekTitle(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      'starting': 'Semaine de démarrage',
      'refinement': 'Semaine de raffinement',
      'transformation': 'Semaine de transformation',
      'implementation': 'Semaine de mise en œuvre',
      'other': 'Semaine non identifiée',
    });
    return '$_temp0';
  }

  @override
  String week(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      'starting': 'démarrage',
      'refinement': 'raffinement',
      'transformation': 'transformation',
      'implementation': 'mise en œuvre',
      'other': 'non identifiée',
    });
    return '$_temp0';
  }

  @override
  String dayTitle(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'monday': 'Lundi',
      'tuesday': 'Mardi',
      'wednesday': 'Mercredi',
      'thursday': 'Jeudi',
      'friday': 'Vendredi',
      'saturday': 'Samedi',
      'sunday': 'Dimanche',
      'other': 'Jour non identifié',
    });
    return '$_temp0';
  }

  @override
  String day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'monday': 'lundi',
      'tuesday': 'mardi',
      'wednesday': 'mercredi',
      'thursday': 'jeudi',
      'friday': 'vendredi',
      'saturday': 'samedi',
      'sunday': 'dimanche',
      'other': 'non identifié',
    });
    return '$_temp0';
  }
}
