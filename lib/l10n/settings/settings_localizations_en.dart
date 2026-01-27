// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'settings_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SettingsLocalizationsEn extends SettingsLocalizations {
  SettingsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get menu_caption => 'Settings';

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
      'hamewari': 'Hamewari Calendar',
      'other': 'Undefined Calendar',
    });
    return '$_temp0';
  }

  @override
  String get settings_effects => 'Effects';

  @override
  String get settings_haptics_enabled => 'Haptics enabled';

  @override
  String get settings_timezone => 'Timezone';

  @override
  String get settings_timezone_system => 'System';

  @override
  String get settings_timezone_hint => 'Search for a timezone';

  @override
  String get settings_timezone_no_results => 'No timezone has been found';

  @override
  String get settings_default_event_duration => 'Default event duration';

  @override
  String settings_default_event_durations(String duration) {
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
  String get settings_reset_button => 'Reset settings';

  @override
  String get settings_reset_button_confirm_content =>
      'Are you sure to reset all settings?';

  @override
  String get settings_reset_button_confirm_action => 'Reset settings';

  @override
  String get settings_reset_button_confirm_cancel => 'Cancel';
}
