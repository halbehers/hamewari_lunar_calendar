// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_name => 'Hamewari Calendario';

  @override
  String get app_loading => 'Cargando la aplicación...';

  @override
  String get language_en => 'Inglés';

  @override
  String get language_fr => 'Francés';

  @override
  String get language_es => 'Español';

  @override
  String get caption_calendar => 'Calendario';

  @override
  String get caption_tasks => 'Tareas';

  @override
  String get caption_settings => 'Configuración';

  @override
  String get caption_today => 'Hoy';

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

  @override
  String get zero_day => 'Día cero';

  @override
  String moon_month_title(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Luna magnética',
      '2': 'Luna lunar',
      '3': 'Luna eléctrica',
      '4': 'Luna autoexistente',
      '5': 'Luna armónica',
      '6': 'Luna rítmica',
      '7': 'Luna resonante',
      '8': 'Luna galáctica',
      '9': 'Luna solar',
      '10': 'Luna planetaria',
      '11': 'Luna espectral',
      '12': 'Luna de cristal',
      '13': 'Luna cósmica',
      'other': 'Luna no identificada',
    });
    return '$_temp0';
  }

  @override
  String moon_month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'magnética',
      '2': 'lunar',
      '3': 'eléctrica',
      '4': 'autoexistente',
      '5': 'armónica',
      '6': 'rítmica',
      '7': 'resonante',
      '8': 'galáctica',
      '9': 'solar',
      '10': 'planetaria',
      '11': 'espectral',
      '12': 'cristal',
      '13': 'cósmica',
      'other': 'no identificada',
    });
    return '$_temp0';
  }

  @override
  String moon_week_title(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      '1': 'Semana inicial',
      '2': 'Semana de refinamiento',
      '3': 'Semana de la transformación',
      '4': 'Semana de implementación',
      'other': 'Semana no identificada',
    });
    return '$_temp0';
  }

  @override
  String moon_week(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      '1': 'inicial',
      '2': 'refinamiento',
      '3': 'transformación',
      '4': 'implementación',
      'other': 'no identificada',
    });
    return '$_temp0';
  }

  @override
  String moon_day_title(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Lunes',
      '2': 'Martes',
      '3': 'Miércoles',
      '4': 'Jueves',
      '5': 'Viernes',
      '6': 'Sábado',
      '7': 'Domingo',
      'other': 'Día no identificado',
    });
    return '$_temp0';
  }

  @override
  String moon_day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'lunes',
      '2': 'martes',
      '3': 'miércoles',
      '4': 'jueves',
      '5': 'viernes',
      '6': 'sábado',
      '7': 'domingo',
      'other': 'no identificado',
    });
    return '$_temp0';
  }

  @override
  String gregorian_month_title(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Enero',
      '2': 'Febrero',
      '3': 'Marzo',
      '4': 'Abril',
      '5': 'Mayo',
      '6': 'Junio',
      '7': 'Julio',
      '8': 'Agosto',
      '9': 'Septiembre',
      '10': 'Octubre',
      '11': 'Noviembre',
      '12': 'Diciembre',
      'other': 'Mes no identificado',
    });
    return '$_temp0';
  }

  @override
  String gregorian_month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'enero',
      '2': 'febrero',
      '3': 'marzo',
      '4': 'abril',
      '5': 'mayo',
      '6': 'junio',
      '7': 'julio',
      '8': 'agosto',
      '9': 'septiembre',
      '10': 'octubre',
      '11': 'noviembre',
      '12': 'diciembre',
      'other': 'no identificado',
    });
    return '$_temp0';
  }

  @override
  String gregorian_day_title(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Lunes',
      '2': 'Martes',
      '3': 'Miércoles',
      '4': 'Jueves',
      '5': 'Viernes',
      '6': 'Sábado',
      '7': 'Domingo',
      'other': 'Día no identificado',
    });
    return '$_temp0';
  }

  @override
  String gregorian_day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'lunes',
      '2': 'martes',
      '3': 'miércoles',
      '4': 'jueves',
      '5': 'viernes',
      '6': 'sábado',
      '7': 'domingo',
      'other': 'no identificado',
    });
    return '$_temp0';
  }
}
