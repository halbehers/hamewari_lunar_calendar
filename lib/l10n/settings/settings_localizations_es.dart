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
  String get title => 'Configuración';

  @override
  String get display => 'Pantalla';

  @override
  String get display_menu_caption => 'Mostrar las etiquetas del menú';

  @override
  String get language => 'Idioma';

  @override
  String get language_system => 'Sistema';

  @override
  String get theme_mode => 'Tema';

  @override
  String get theme_mode_dark => 'Oscuro';

  @override
  String get theme_mode_light => 'Claro';

  @override
  String get theme_mode_system => 'Sistema';

  @override
  String get calendar => 'Calendario';

  @override
  String get calendar_type => 'Tipo';

  @override
  String calendar_types(String dateType) {
    String _temp0 = intl.Intl.selectLogic(dateType, {
      'gregorian': 'Calendario gregoriano',
      'yearZero': 'Calendario Year Zero',
      'hamewari': 'Calendario Hamewari',
      'other': 'Calendario no identificado',
    });
    return '$_temp0';
  }

  @override
  String get effects => 'Efectos';

  @override
  String get haptics_enabled => 'Haptics habilitado';

  @override
  String get timezone => 'Zona horaria';

  @override
  String get timezone_system => 'Sistema';

  @override
  String get timezone_hint => 'Buscar una zona horaria';

  @override
  String get timezone_no_results => 'No se ha encontrado ninguna zona horaria';

  @override
  String get default_event_duration => 'Duración predeterminada de eventos';

  @override
  String default_event_durations(String duration) {
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
  String get reset_button => 'Restablecer configuración';

  @override
  String get reset_button_confirm_content =>
      '¿Está seguro de que desea restablecer todos los ajustes?';

  @override
  String get reset_button_confirm_action => 'Restablecer configuración';

  @override
  String get reset_button_confirm_cancel => 'Cancelar';
}
