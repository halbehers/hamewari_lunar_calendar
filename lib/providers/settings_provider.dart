import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamewari/calendar/date_factory.dart';
import 'package:hamewari/db/models/setting.dart';
import 'package:hamewari/db/services/settings_service.dart';
import 'package:hamewari/l10n/general/general_localizations.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart';
import 'package:timezone/timezone.dart';

class SettingsProvider extends ChangeNotifier {
  final SettingsService service = SettingsService();

  bool _initialized = false;
  bool get initialized => _initialized;

  SettingsProvider() {
    _init();
  }

  static SettingsProvider of(BuildContext context, {bool listen = true}) =>
      Provider.of<SettingsProvider>(context, listen: listen);

  void _init() async {
    initializeTimeZones();

    {
      Setting? setting = await service.findByName(
        SettingsService.selectedCalendarViewIndexId,
      );

      if (setting != null) {
        setSelectedCalendarViewIndex(
          int.parse(setting.value ?? '$selectedCalendarViewIndexDefaultValue'),
          persistChange: false,
        );
      }
    }
    {
      Setting? setting = await service.findByName(
        SettingsService.selectedLocaleId,
      );

      if (setting != null) {
        setSettingLocale(
          setting.value != null
              ? SettingLocale.fromLanguageCode(setting.value!)
              : SettingLocale.empty,
          persistChange: false,
        );
      }
    }
    {
      Setting? setting = await service.findByName(
        SettingsService.displayMenuCaptionsId,
      );

      if (setting != null) {
        setDisplayMenuCaptions(setting.value == "true", persistChange: false);
      }
    }
    {
      Setting? setting = await service.findByName(
        SettingsService.selectedThemeModeId,
      );

      if (setting != null) {
        setThemeMode(
          ThemeMode.values.singleWhere((mode) => mode.name == setting.value),
          persistChange: false,
        );
      }
    }
    {
      Setting? setting = await service.findByName(
        SettingsService.selectedCalendarId,
      );

      if (setting != null) {
        setCalendar(
          DateType.values.singleWhere((mode) => mode.name == setting.value),
          persistChange: false,
        );
      }
    }
    {
      Setting? setting = await service.findByName(
        SettingsService.defaultEventDurationId,
      );

      if (setting != null) {
        try {
          setDefaultEventDuration(
            DefaultEventDuration.values.singleWhere(
              (mode) => mode.name == setting.value,
            ),
            persistChange: false,
          );
        } catch (error) {
          // Nothing to do.
        }
      }
    }
    {
      Setting? setting = await service.findByName(
        SettingsService.hapticsEnabledId,
      );

      if (setting != null) {
        setHapticEnabled(setting.value == "true", persistChange: false);
      }
    }
    {
      Setting? setting = await service.findByName(
        SettingsService.selectedTimezoneId,
      );

      if (setting != null) {
        setTimezone(
          SettingTimezone.fromLocationName(setting.value),
          persistChange: false,
        );
      }
    }

    _initialized = true;
    notifyListeners();
  }

  static const int selectedCalendarViewIndexDefaultValue = 0;

  int _selectedCalendarViewIndex = selectedCalendarViewIndexDefaultValue;

  int get selectedCalendarViewIndex => _selectedCalendarViewIndex;

  void setSelectedCalendarViewIndex(
    int calendarViewIndex, {
    bool persistChange = true,
  }) {
    _selectedCalendarViewIndex = calendarViewIndex;
    notifyListeners();
    if (persistChange) {
      service.setupByName<int>(
        SettingsService.selectedCalendarViewIndexId,
        calendarViewIndex,
        valueType: SettingValueType.number,
      );
    }
  }

  void resetSelectedCalendarViewIndex({bool persistChange = true}) {
    _selectedCalendarViewIndex = selectedCalendarViewIndexDefaultValue;
    notifyListeners();

    if (persistChange) {
      service.deleteByName(SettingsService.selectedCalendarViewIndexId);
    }
  }

  static final SettingLocale settingLocaleDefaultValue = SettingLocale.empty;

  SettingLocale _settingLocale = settingLocaleDefaultValue;

  SettingLocale get settingLocale => _settingLocale;

  void setSettingLocale(SettingLocale locale, {bool persistChange = true}) {
    if (locale.isEmpty() ||
        !GeneralLocalizations.supportedLocales.contains(locale.locale)) {
      _settingLocale = SettingLocale.empty;
    }

    _settingLocale = locale;
    notifyListeners();
    if (persistChange) {
      service.setupByName(
        SettingsService.selectedLocaleId,
        locale.locale.toString(),
      );
    }
  }

  void resetSettingLocale({bool persistChange = true}) {
    _settingLocale = settingLocaleDefaultValue;
    notifyListeners();

    if (persistChange) {
      service.deleteByName(SettingsService.selectedLocaleId);
    }
  }

  static const bool displayMenuCaptionsDefaultValue = false;

  bool _displayMenuCaptions = displayMenuCaptionsDefaultValue;

  bool get displayMenuCaptions => _displayMenuCaptions;

  void setDisplayMenuCaptions(
    bool displayMenuCaptions, {
    bool persistChange = true,
  }) {
    _displayMenuCaptions = displayMenuCaptions;
    notifyListeners();
    if (persistChange) {
      service.setupByName(
        SettingsService.displayMenuCaptionsId,
        displayMenuCaptions ? "true" : "false",
        valueType: SettingValueType.boolean,
      );
    }
  }

  void resetDisplayMenuCaptions({bool persistChange = true}) {
    _displayMenuCaptions = displayMenuCaptionsDefaultValue;
    notifyListeners();

    if (persistChange) {
      service.deleteByName(SettingsService.displayMenuCaptionsId);
    }
  }

  static const ThemeMode themeModeDefaultValue = ThemeMode.system;

  ThemeMode _themeMode = themeModeDefaultValue;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode themeMode, {bool persistChange = true}) {
    _themeMode = themeMode;
    notifyListeners();
    if (persistChange) {
      service.setupByName(SettingsService.selectedThemeModeId, themeMode.name);
    }
  }

  void resetThemeMode({bool persistChange = true}) {
    _themeMode = themeModeDefaultValue;
    notifyListeners();

    if (persistChange) {
      service.deleteByName(SettingsService.selectedThemeModeId);
    }
  }

  static const DateType calendarDefaultValue = DateType.gregorian;

  DateType _calendar = calendarDefaultValue;

  DateType get calendar => _calendar;

  void setCalendar(DateType calendar, {bool persistChange = true}) {
    _calendar = calendar;
    notifyListeners();
    if (persistChange) {
      service.setupByName(SettingsService.selectedCalendarId, calendar.name);
    }
  }

  void resetCalendar({bool persistChange = true}) {
    _calendar = calendarDefaultValue;
    notifyListeners();

    if (persistChange) {
      service.deleteByName(SettingsService.selectedCalendarId);
    }
  }

  static const DefaultEventDuration defaultEventDurationDefaultValue =
      DefaultEventDuration.oneHour;

  DefaultEventDuration _defaultEventDuration = defaultEventDurationDefaultValue;

  DefaultEventDuration get defaultEventDuration => _defaultEventDuration;

  void setDefaultEventDuration(
    DefaultEventDuration duration, {
    bool persistChange = true,
  }) {
    _defaultEventDuration = duration;
    notifyListeners();
    if (persistChange) {
      service.setupByName(
        SettingsService.defaultEventDurationId,
        duration.name,
      );
    }
  }

  void resetDefaultEventDuration({bool persistChange = true}) {
    _defaultEventDuration = defaultEventDurationDefaultValue;
    notifyListeners();

    if (persistChange) {
      service.deleteByName(SettingsService.defaultEventDurationId);
    }
  }

  static const bool hapticEnabledDefaultValue = true;

  bool _hapticEnabled = hapticEnabledDefaultValue;

  bool get hapticEnabled => _hapticEnabled;

  void setHapticEnabled(bool isEnabled, {bool persistChange = true}) {
    _hapticEnabled = isEnabled;
    notifyListeners();
    if (persistChange) {
      service.setupByName(
        SettingsService.hapticsEnabledId,
        _hapticEnabled,
        valueType: SettingValueType.boolean,
      );
    }
  }

  void resetHapticEnabled({bool persistChange = true}) {
    _hapticEnabled = hapticEnabledDefaultValue;
    notifyListeners();

    if (persistChange) {
      service.deleteByName(SettingsService.hapticsEnabledId);
    }
  }

  static final SettingTimezone timezoneDefaultValue = SettingTimezone.empty;

  SettingTimezone _timezone = timezoneDefaultValue;

  SettingTimezone get timezone => _timezone;

  void setTimezone(SettingTimezone timezone, {bool persistChange = true}) {
    _timezone = timezone;
    notifyListeners();
    if (persistChange) {
      service.setupByName(
        SettingsService.selectedTimezoneId,
        _timezone.name.toString(),
      );
    }
  }

  void resetTimezone({bool persistChange = true}) {
    _timezone = timezoneDefaultValue;
    notifyListeners();

    if (persistChange) {
      service.deleteByName(SettingsService.selectedTimezoneId);
    }
  }

  void resetSettings() {
    resetSelectedCalendarViewIndex();
    resetSettingLocale();
    resetDisplayMenuCaptions();
    resetThemeMode();
    resetCalendar();
    resetHapticEnabled();
    resetDefaultEventDuration();
    resetTimezone();
  }
}

class SettingLocale {
  SettingLocale(this.locale);

  final Locale? locale;

  bool isEmpty() {
    return locale == null;
  }

  bool isNotEmpty() {
    return locale != null;
  }

  static SettingLocale get empty {
    return SettingLocale(null);
  }

  static SettingLocale of(Locale locale) {
    return SettingLocale(locale);
  }

  static SettingLocale fromLanguageCode(String languageCode) {
    return SettingLocale(Locale(languageCode));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! SettingLocale) {
      return false;
    }
    if (locale == null && other.locale == null) {
      return true;
    }

    return locale == other.locale;
  }

  @override
  int get hashCode => locale.hashCode;

  @override
  String toString() {
    if (locale == null) return '[SettingLocale] empty';
    return '[SettingLocale] $locale';
  }
}

class SettingTimezone {
  SettingTimezone(this.location);

  final Location? location;

  bool isEmpty() {
    return location == null;
  }

  bool isNotEmpty() {
    return location != null;
  }

  String? get name {
    return location?.name;
  }

  String get l10nKey {
    if (isEmpty()) return "system";

    return name!
        .toLowerCase()
        .replaceAll('/', '_')
        .replaceAll('+', '_plus_')
        .replaceAll('gmt-', 'gmt_minus_')
        .replaceAll('-', '_');
  }

  String getNameOrElse(String defaultValue) {
    if (isEmpty()) return defaultValue;

    return location!.name;
  }

  static SettingTimezone get empty {
    return SettingTimezone(null);
  }

  static SettingTimezone of(Location location) {
    return SettingTimezone(location);
  }

  static SettingTimezone fromLocationName(String? name) {
    final Location? location = timeZoneDatabase.locations[name];

    if (location == null) return SettingTimezone.empty;

    return SettingTimezone.of(location);
  }

  static List<SettingTimezone> get all {
    return timeZoneDatabase.locations.values
        .map((location) => SettingTimezone.of(location))
        .toList();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! SettingTimezone) {
      return false;
    }
    if (location == null && other.location == null) {
      return true;
    }

    return location == other.location;
  }

  @override
  int get hashCode => location.hashCode;

  @override
  String toString() {
    if (location == null) return '[SettingTimezone] empty';
    return '[SettingTimezone] ${location!.name}';
  }
}

class Timezones {
  bool initialized = false;
  late Map<String, String> _translations;

  Future<void> load(BuildContext context) async {
    final locale = Localizations.localeOf(context).toString();
    final jsonString = await rootBundle.loadString(
      'lib/l10n/timezones/timezones_$locale.arb',
    );
    final Map<String, dynamic> data = json.decode(jsonString);
    _translations = data.map((key, value) => MapEntry(key, value.toString()));
    initialized = true;
  }

  String operator [](String key) => _translations[key] ?? key;
}

enum DefaultEventDuration {
  none(0),
  fifteenMinutes(15),
  twentyMinutes(20),
  thirtyMinutes(30),
  fortyFiveMinutes(45),
  oneHour(60),
  ninetyMinutes(90),
  twoHours(120);

  const DefaultEventDuration(this.durationInMinutes);

  final int durationInMinutes;
}
