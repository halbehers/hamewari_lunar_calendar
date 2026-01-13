import 'package:flutter/material.dart';
import 'package:hamewari/db/models/setting.dart';
import 'package:hamewari/db/services/settings_service.dart';
import 'package:hamewari/l10n/app_localizations.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider() {
    initSettings();
  }

  final SettingsService service = SettingsService();

  void initSettings() async {
    {
      Setting? setting = await service.findByName(
        SettingsService.selectedLocaleId,
      );

      if (setting != null) {
        setLocale(Locale(setting.value), persistChange: false);
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
  }

  Locale? _locale = Locale("en");

  Locale? get locale => _locale;

  void setLocale(Locale? locale, {bool persistChange = true}) {
    if (locale == null || !AppLocalizations.supportedLocales.contains(locale)) {
      _locale = null;
    }

    _locale = locale;
    notifyListeners();
    if (persistChange) {
      service.setupByName(SettingsService.selectedLocaleId, locale.toString());
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
}
