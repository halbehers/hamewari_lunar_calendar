// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'settings_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class SettingsLocalizationsEs extends SettingsLocalizations {
  SettingsLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get menu_caption => 'Configuración';

  @override
  String get settings_title => 'Configuración';

  @override
  String get settings_display => 'Pantalla';

  @override
  String get settings_display_menu_caption => 'Mostrar las etiquetas del menú';

  @override
  String get settings_language => 'Idioma';

  @override
  String get settings_language_system => 'Sistema';

  @override
  String get settings_theme_mode => 'Tema';

  @override
  String get theme_mode_dark => 'Oscuro';

  @override
  String get theme_mode_light => 'Claro';

  @override
  String get theme_mode_system => 'Sistema';

  @override
  String get settings_calendar => 'Calendario';

  @override
  String get settings_calendar_type => 'Tipo';

  @override
  String settings_calendar_types(String dateType) {
    String _temp0 = intl.Intl.selectLogic(dateType, {
      'gregorian': 'Calendario gregoriano',
      'yearZero': 'Calendario Year Zero',
      'hamewari': 'Calendario Hamewari',
      'other': 'Calendario no identificado',
    });
    return '$_temp0';
  }

  @override
  String get settings_effects => 'Efectos';

  @override
  String get settings_haptics_enabled => 'Haptics habilitado';

  @override
  String get settings_timezone => 'Zona horaria';

  @override
  String get settings_timezone_system => 'Sistema';

  @override
  String get settings_timezone_hint => 'Buscar una zona horaria';

  @override
  String get settings_timezone_no_results =>
      'No se ha encontrado ninguna zona horaria';

  @override
  String get settings_default_event_duration =>
      'Duración predeterminada de eventos';

  @override
  String settings_default_event_durations(String duration) {
    String _temp0 = intl.Intl.selectLogic(duration, {
      'fifteenMinutes': '15 minutos',
      'twentyMinutes': '20 minutos',
      'thirtyMinutes': '30 minutos',
      'fortyFiveMinutes': '45 minutos',
      'oneHour': '60 minutos',
      'ninetyMinutes': '90 minutos',
      'twoHours': '120 minutos',
      'other': 'Duración no identificada',
    });
    return '$_temp0';
  }

  @override
  String get settings_reset_button => 'Restablecer configuración';

  @override
  String get settings_reset_button_confirm_content =>
      '¿Está seguro de que desea restablecer todos los ajustes?';

  @override
  String get settings_reset_button_confirm_action =>
      'Restablecer configuración';

  @override
  String get settings_reset_button_confirm_cancel => 'Cancelar';
}
