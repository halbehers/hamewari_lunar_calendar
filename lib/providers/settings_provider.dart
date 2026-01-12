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
    Setting? setting = await service.findByName(
      SettingsService.displayMenuCaptionsId,
    );

    if (setting != null) {
      setDisplayMenuCaptions(setting.value == "true", persistChange: false);
    }
  }

  Locale _locale = Locale("en");

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;

    _locale = locale;
    notifyListeners();
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
}
