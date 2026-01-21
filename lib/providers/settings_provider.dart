import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date_factory.dart';
import 'package:hamewari/db/models/setting.dart';
import 'package:hamewari/db/services/settings_service.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
    {
      Setting? setting = await service.findByName(
        SettingsService.selectedCalendarViewIndexId,
      );

      if (setting != null) {
        setSelectedCalendarViewIndex(
          int.parse(setting.value ?? "0"),
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
              : SettingLocale.empty(),
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

    _initialized = true;
    notifyListeners();
  }

  int _selectedCalendarViewIndex = 0;

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

  SettingLocale _settingLocale = SettingLocale.empty();

  SettingLocale get settingLocale => _settingLocale;

  void setSettingLocale(SettingLocale locale, {bool persistChange = true}) {
    if (locale.isEmpty() ||
        !AppLocalizations.supportedLocales.contains(locale.locale)) {
      _settingLocale = SettingLocale.empty();
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

  bool _displayMenuCaptions = false;

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

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode themeMode, {bool persistChange = true}) {
    _themeMode = themeMode;
    notifyListeners();
    if (persistChange) {
      service.setupByName(SettingsService.selectedThemeModeId, themeMode.name);
    }
  }

  DateType _calendar = DateType.gregorian;

  DateType get calendar => _calendar;

  void setCalendar(DateType calendar, {bool persistChange = true}) {
    _calendar = calendar;
    notifyListeners();
    if (persistChange) {
      service.setupByName(SettingsService.selectedCalendarId, calendar.name);
    }
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

  static SettingLocale empty() {
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
