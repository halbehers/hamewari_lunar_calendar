import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// Name of the app
  ///
  /// In en, this message translates to:
  /// **'Hamewari Calendar'**
  String get app_name;

  /// App loading text
  ///
  /// In en, this message translates to:
  /// **'Loading the app...'**
  String get app_loading;

  /// English language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_en;

  /// French language
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get language_fr;

  /// Spanish language
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get language_es;

  /// Calendar menu caption
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get caption_calendar;

  /// Tasks menu caption
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get caption_tasks;

  /// Settings menu caption
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get caption_settings;

  /// Today menu caption
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get caption_today;

  /// Settings page title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// Setting display caption
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get settings_display;

  /// Setting display menu caption
  ///
  /// In en, this message translates to:
  /// **'Display menu caption'**
  String get settings_display_menu_caption;

  /// Setting language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// Setting language system label
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settings_language_system;

  /// Setting theme mode
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get settings_theme_mode;

  /// Theme mode dark
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get theme_mode_dark;

  /// Theme mode light
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get theme_mode_light;

  /// Theme mode system
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get theme_mode_system;

  /// Setting calendar caption
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get settings_calendar;

  /// Setting calendar type
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get settings_calendar_type;

  /// Calendar types by name
  ///
  /// In en, this message translates to:
  /// **'{dateType, select, gregorian {Gregorian Calendar} yearZero {Year Zero Calendar} hamewari {Hamewari Calendar} other {Undefined Calendar}}'**
  String settings_calendar_types(String dateType);

  /// Setting effect caption
  ///
  /// In en, this message translates to:
  /// **'Effects'**
  String get settings_effects;

  /// Setting enabled haptics
  ///
  /// In en, this message translates to:
  /// **'Haptics enabled'**
  String get settings_haptics_enabled;

  /// Setting timezone
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get settings_timezone;

  /// Setting timezone system label
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settings_timezone_system;

  /// Setting timezone hint
  ///
  /// In en, this message translates to:
  /// **'Search for a timezone'**
  String get settings_timezone_hint;

  /// Setting timezone no result
  ///
  /// In en, this message translates to:
  /// **'No timezone has been found'**
  String get settings_timezone_no_results;

  /// Setting default event duration
  ///
  /// In en, this message translates to:
  /// **'Default event duration'**
  String get settings_default_event_duration;

  /// Default event durations by name
  ///
  /// In en, this message translates to:
  /// **'{duration, select, fifteenMinutes {15 minutes} twentyMinutes {20 minutes} thirtyMinutes {30 minutes} fortyFiveMinutes {45 minutes} oneHour {60 minutes} ninetyMinutes {90 minutes} twoHours{120 minutes} other {Unknown duration} }'**
  String settings_default_event_durations(String duration);

  /// Setting reset button
  ///
  /// In en, this message translates to:
  /// **'Reset settings'**
  String get settings_reset_button;

  /// Setting reset confirm content
  ///
  /// In en, this message translates to:
  /// **'Are you sure to reset all settings?'**
  String get settings_reset_button_confirm_content;

  /// Setting reset confirm action
  ///
  /// In en, this message translates to:
  /// **'Reset settings'**
  String get settings_reset_button_confirm_action;

  /// Setting reset confirm cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settings_reset_button_confirm_cancel;

  /// Zero day
  ///
  /// In en, this message translates to:
  /// **'Zero Day'**
  String get zero_day;

  /// Moon month titles by number
  ///
  /// In en, this message translates to:
  /// **'{month, select, 1 {Magnetic Moon} 2 {Lunar Moon} 3 {Electric Moon} 4 {Self-Existing Moon} 5 {Harmonic Moon} 6 {Rhythmic Moon} 7 {Resonant Moon} 8 {Galactic Moon} 9 {Solar Moon} 10 {Planetary Moon} 11 {Spectral Moon} 12 {Crystal Moon} 13 {Cosmic Moon} other {Unidentified Moon}}'**
  String moon_month_title(String month);

  /// Moon months by number
  ///
  /// In en, this message translates to:
  /// **'{month, select, 1 {magnetic} 2 {lunar} 3 {electric} 4 {self-existing} 5 {harmonic} 6 {rhythmic} 7 {resonant} 8 {galactic} 9 {solar} 10 {planetary} 11 {spectral} 12 {crystal} 13 {cosmic} other {unidentified}}'**
  String moon_month(String month);

  /// Moon week titles by number
  ///
  /// In en, this message translates to:
  /// **'{week, select, 1 {Starting Week} 2 {Refinement Week} 3 {Transformation Week} 4 {Implementation Week} other {Unidentified Week}}'**
  String moon_week_title(String week);

  /// Moon weeks by number
  ///
  /// In en, this message translates to:
  /// **'{week, select, 1 {starting} 2 {refinement} 3 {transformation} 4 {implementation} other {unidentified}}'**
  String moon_week(String week);

  /// Moon day titles by number
  ///
  /// In en, this message translates to:
  /// **'{day, select, 1 {Monday} 2 {Tuesday} 3 {Wednesday} 4 {Thursday} 5 {Friday} 6 {Saturday} 7 {Sunday} other {Unidentified Day}}'**
  String moon_day_title(String day);

  /// Moon days by number
  ///
  /// In en, this message translates to:
  /// **'{day, select, 1 {monday} 2 {tuesday} 3 {wednesday} 4 {thursday} 5 {friday} 6 {saturday} 7 {sunday} other {unidentified}}'**
  String moon_day(String day);

  /// Gregorian month titles by number
  ///
  /// In en, this message translates to:
  /// **'{month, select, 1 {January} 2 {February} 3 {March} 4 {April} 5 {May} 6 {June} 7 {July} 8 {August} 9 {September} 10 {October} 11 {November} 12 {December} other {Unidentified Month}}'**
  String gregorian_month_title(String month);

  /// Gregorian months by number
  ///
  /// In en, this message translates to:
  /// **'{month, select, 1 {january} 2 {february} 3 {march} 4 {april} 5 {may} 6 {june} 7 {july} 8 {august} 9 {september} 10 {october} 11 {november} 12 {december} other {unidentified}}'**
  String gregorian_month(String month);

  /// Gregorian day titles by number
  ///
  /// In en, this message translates to:
  /// **'{day, select, 1 {Monday} 2 {Tuesday} 3 {Wednesday} 4 {Thursday} 5 {Friday} 6 {Saturday} 7 {Sunday} other {Unidentified Day}}'**
  String gregorian_day_title(String day);

  /// Gregorian days by number
  ///
  /// In en, this message translates to:
  /// **'{day, select, 1 {monday} 2 {tuesday} 3 {wednesday} 4 {thursday} 5 {friday} 6 {saturday} 7 {sunday} other {unidentified}}'**
  String gregorian_day(String day);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
