import 'package:flutter/material.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/settings/searchable_list_setting.dart';

class TimezoneSetting extends StatefulWidget {
  const TimezoneSetting({super.key, this.label});

  final String? label;

  @override
  State<TimezoneSetting> createState() => _TimezoneSettingState();
}

class _TimezoneSettingState extends State<TimezoneSetting> {
  bool _loading = true;
  Timezones? _tTimezone;
  Locale? _currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final locale = Localizations.localeOf(context);
    // Only reload if locale changed
    if (_currentLocale != locale) {
      _currentLocale = locale;
      _loadTranslations();
    }
  }

  Future<void> _loadTranslations() async {
    final t = Timezones();
    await t.load(context);
    setState(() {
      _tTimezone = t;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tSettings = SettingsLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);
    final isLoading = _loading || _tTimezone == null;

    return SearchableListSetting<SettingTimezone>(
      label: widget.label ?? tSettings.timezone,
      initialValue: SearchableListSettingItem(
        label: isLoading ? " " : _tTimezone![settingsProvider.timezone.l10nKey],
        value: settingsProvider.timezone,
      ),
      onChanged: settingsProvider.setTimezone,
      items: [
        SearchableListSettingItem(
          label: tSettings.timezone_system,
          value: SettingTimezone.empty,
        ),
        ...SettingTimezone.all.map(
          (timezone) => SearchableListSettingItem(
            label: isLoading ? "..." : _tTimezone![timezone.l10nKey],
            value: timezone,
          ),
        ),
      ],
    );
  }
}
