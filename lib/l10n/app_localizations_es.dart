// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

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
  String monthTitle(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'magnetic': 'Luna magnética',
      'lunar': 'Luna lunar',
      'electric': 'Luna eléctrica',
      'selfExisting': 'Luna autoexistente',
      'harmonic': 'Luna armónica',
      'rhythmic': 'Luna rítmica',
      'resonant': 'Luna resonante',
      'galactic': 'Luna galáctica',
      'solar': 'Luna solar',
      'planetary': 'Luna planetaria',
      'spectral': 'Luna espectral',
      'crystal': 'Luna de cristal',
      'cosmic': 'Luna cósmica',
      'other': 'Luna no identificada',
    });
    return '$_temp0';
  }

  @override
  String month(String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      'magnetic': 'magnética',
      'lunar': 'lunar',
      'electric': 'eléctrica',
      'selfExisting': 'autoexistente',
      'harmonic': 'armónica',
      'rhythmic': 'rítmica',
      'resonant': 'resonante',
      'galactic': 'galáctica',
      'solar': 'solar',
      'planetary': 'planetaria',
      'spectral': 'espectral',
      'crystal': 'cristal',
      'cosmic': 'cósmica',
      'other': 'no identificada',
    });
    return '$_temp0';
  }

  @override
  String weekTitle(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      'starting': 'Semana inicial',
      'refinement': 'Semana de refinamiento',
      'transformation': 'Semana de la transformación',
      'implementation': 'Semana de implementación',
      'other': 'Semana no identificada',
    });
    return '$_temp0';
  }

  @override
  String week(String week) {
    String _temp0 = intl.Intl.selectLogic(week, {
      'starting': 'inicial',
      'refinement': 'refinamiento',
      'transformation': 'transformación',
      'implementation': 'implementación',
      'other': 'no identificada',
    });
    return '$_temp0';
  }

  @override
  String dayTitle(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'monday': 'Lunes',
      'tuesday': 'Martes',
      'wednesday': 'Miércoles',
      'thursday': 'Jueves',
      'friday': 'Viernes',
      'saturday': 'Sábado',
      'sunday': 'Domingo',
      'other': 'Día no identificado',
    });
    return '$_temp0';
  }

  @override
  String day(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'monday': 'lunes',
      'tuesday': 'martes',
      'wednesday': 'miércoles',
      'thursday': 'jueves',
      'friday': 'viernes',
      'saturday': 'sábado',
      'sunday': 'domingo',
      'other': 'no identificado',
    });
    return '$_temp0';
  }
}
