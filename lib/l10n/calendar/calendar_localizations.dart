import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'calendar_localizations_en.dart';
import 'calendar_localizations_es.dart';
import 'calendar_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CalendarLocalizations
/// returned by `CalendarLocalizations.of(context)`.
///
/// Applications need to include `CalendarLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'calendar/calendar_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CalendarLocalizations.localizationsDelegates,
///   supportedLocales: CalendarLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CalendarLocalizations.supportedLocales
/// property.
abstract class CalendarLocalizations {
  CalendarLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CalendarLocalizations? of(BuildContext context) {
    return Localizations.of<CalendarLocalizations>(
      context,
      CalendarLocalizations,
    );
  }

  static const LocalizationsDelegate<CalendarLocalizations> delegate =
      _CalendarLocalizationsDelegate();

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

  /// Calendar menu caption
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get menu_caption;

  /// Today menu caption
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get caption_today;

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

  /// Zero day
  ///
  /// In en, this message translates to:
  /// **'Zero Day'**
  String get zero_day;
}

class _CalendarLocalizationsDelegate
    extends LocalizationsDelegate<CalendarLocalizations> {
  const _CalendarLocalizationsDelegate();

  @override
  Future<CalendarLocalizations> load(Locale locale) {
    return SynchronousFuture<CalendarLocalizations>(
      lookupCalendarLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_CalendarLocalizationsDelegate old) => false;
}

CalendarLocalizations lookupCalendarLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return CalendarLocalizationsEn();
    case 'es':
      return CalendarLocalizationsEs();
    case 'fr':
      return CalendarLocalizationsFr();
  }

  throw FlutterError(
    'CalendarLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
