// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'Hamewari Calendar';

  @override
  String get app_loading => 'Loading the app...';

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
  String get settings_calendar => 'Calendar';

  @override
  String get settings_calendar_type => 'Type';

  @override
  String settings_calendar_types(String dateType) {
    String _temp0 = intl.Intl.selectLogic(dateType, {
      'gregorian': 'Gregorian Calendar',
      'yearZero': 'Year Zero Calendar',
      'other': 'Undefined Calendar',
    });
    return '$_temp0';
  }

  @override
  String moon_month_title(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Magnetic Moon',
      '2': 'Lunar Moon',
      '3': 'Electric Moon',
      '4': 'Self-Existing Moon',
      '5': 'Harmonic Moon',
      '6': 'Rhythmic Moon',
      '7': 'Resonant Moon',
      '8': 'Galactic Moon',
      '9': 'Solar Moon',
      '10': 'Planetary Moon',
      '11': 'Spectral Moon',
      '12': 'Crystal Moon',
      '13': 'Cosmic Moon',
      'other': 'Unidentified Moon',
    });
    return '$_temp0';
  }

  @override
  String moon_month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'magnetic',
      '2': 'lunar',
      '3': 'electric',
      '4': 'self-existing',
      '5': 'harmonic',
      '6': 'rhythmic',
      '7': 'resonant',
      '8': 'galactic',
      '9': 'solar',
      '10': 'planetary',
      '11': 'spectral',
      '12': 'crystal',
      '13': 'cosmic',
      'other': 'unidentified',
    });
    return '$_temp0';
  }

  @override
  String moon_week_title(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      '1': 'Starting Week',
      '2': 'Refinement Week',
      '3': 'Transformation Week',
      '4': 'Implementation Week',
      'other': 'Unidentified Week',
    });
    return '$_temp0';
  }

  @override
  String moon_week(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      '1': 'starting',
      '2': 'refinement',
      '3': 'transformation',
      '4': 'implementation',
      'other': 'unidentified',
    });
    return '$_temp0';
  }

  @override
  String moon_day_title(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Monday',
      '2': 'Tuesday',
      '3': 'Wednesday',
      '4': 'Thursday',
      '5': 'Friday',
      '6': 'Saturday',
      '7': 'Sunday',
      'other': 'Unidentified Day',
    });
    return '$_temp0';
  }

  @override
  String moon_day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'monday',
      '2': 'tuesday',
      '3': 'wednesday',
      '4': 'thursday',
      '5': 'friday',
      '6': 'saturday',
      '7': 'sunday',
      'other': 'unidentified',
    });
    return '$_temp0';
  }

  @override
  String gregorian_month_title(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'January',
      '2': 'February',
      '3': 'March',
      '4': 'April',
      '5': 'May',
      '6': 'June',
      '7': 'July',
      '8': 'August',
      '9': 'September',
      '10': 'October',
      '11': 'November',
      '12': 'December',
      'other': 'Unidentified Month',
    });
    return '$_temp0';
  }

  @override
  String gregorian_month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'january',
      '2': 'february',
      '3': 'march',
      '4': 'april',
      '5': 'may',
      '6': 'june',
      '7': 'july',
      '8': 'august',
      '9': 'september',
      '10': 'october',
      '11': 'november',
      '12': 'december',
      'other': 'unidentified',
    });
    return '$_temp0';
  }

  @override
  String gregorian_day_title(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Monday',
      '2': 'Tuesday',
      '3': 'Wednesday',
      '4': 'Thursday',
      '5': 'Friday',
      '6': 'Saturday',
      '7': 'Sunday',
      'other': 'Unidentified Day',
    });
    return '$_temp0';
  }

  @override
  String gregorian_day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'monday',
      '2': 'tuesday',
      '3': 'wednesday',
      '4': 'thursday',
      '5': 'friday',
      '6': 'saturday',
      '7': 'sunday',
      'other': 'unidentified',
    });
    return '$_temp0';
  }
}
