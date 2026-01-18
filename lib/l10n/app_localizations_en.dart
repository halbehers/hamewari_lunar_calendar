// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language_en => 'English';

  @override
  String get language_fr => 'French';

  @override
  String get language_es => 'Spanish';

  @override
  String get caption_calendar => 'Calendar';

  @override
  String get caption_tasks => 'Tasks';

  @override
  String get caption_settings => 'Settings';

  @override
  String get caption_today => 'Today';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_display => 'Display';

  @override
  String get settings_display_menu_caption => 'Display menu caption';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_language_system => 'System';

  @override
  String get settings_theme_mode => 'Theme Mode';

  @override
  String get theme_mode_dark => 'Dark';

  @override
  String get theme_mode_light => 'Light';

  @override
  String get theme_mode_system => 'System';

  @override
  String monthTitle(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'magnetic': 'Magnetic Moon',
      'lunar': 'Lunar Moon',
      'electric': 'Electric Moon',
      'selfExisting': 'Self-Existing Moon',
      'harmonic': 'Harmonic Moon',
      'rhythmic': 'Rhythmic Moon',
      'resonant': 'Resonant Moon',
      'galactic': 'Galactic Moon',
      'solar': 'Solar Moon',
      'planetary': 'Planetary Moon',
      'spectral': 'Spectral Moon',
      'crystal': 'Crystal Moon',
      'cosmic': 'Cosmic Moon',
      'other': 'Unidentified Moon',
    });
    return '$_temp0';
  }

  @override
  String month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'magnetic': 'magnetic',
      'lunar': 'lunar',
      'electric': 'electric',
      'selfExisting': 'self-existing',
      'harmonic': 'harmonic',
      'rhythmic': 'rhythmic',
      'resonant': 'resonant',
      'galactic': 'galactic',
      'solar': 'solar',
      'planetary': 'planetary',
      'spectral': 'spectral',
      'crystal': 'crystal',
      'cosmic': 'cosmic',
      'other': 'unidentified',
    });
    return '$_temp0';
  }

  @override
  String weekTitle(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      'starting': 'Starting Week',
      'refinement': 'Refinement Week',
      'transformation': 'Transformation Week',
      'implementation': 'Implementation Week',
      'other': 'Unidentified Week',
    });
    return '$_temp0';
  }

  @override
  String week(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      'starting': 'starting',
      'refinement': 'refinement',
      'transformation': 'transformation',
      'implementation': 'implementation',
      'other': 'unidentified',
    });
    return '$_temp0';
  }

  @override
  String dayTitle(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'monday': 'Monday',
      'tuesday': 'Tuesday',
      'wednesday': 'Wednesday',
      'thursday': 'Thursday',
      'friday': 'Friday',
      'saturday': 'Saturday',
      'sunday': 'Sunday',
      'other': 'Unidentified Day',
    });
    return '$_temp0';
  }

  @override
  String day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'monday': 'monday',
      'tuesday': 'tuesday',
      'wednesday': 'wednesday',
      'thursday': 'thursday',
      'friday': 'friday',
      'saturday': 'saturday',
      'sunday': 'sunday',
      'other': 'unidentified',
    });
    return '$_temp0';
  }
}
