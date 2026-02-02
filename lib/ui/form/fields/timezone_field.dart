import 'package:flutter/material.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/form/fields/searchable_list_field.dart';

class TimezoneField extends StatefulWidget {
  const TimezoneField({super.key, this.label});

  final String? label;

  @override
  State<TimezoneField> createState() => _TimezoneFieldState();
}

class _TimezoneFieldState extends State<TimezoneField> {
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

    return SearchableListField<SettingTimezone>(
      label: widget.label ?? tSettings.timezone,
      initialValue: SearchableListItem(
        label: isLoading ? " " : _tTimezone![settingsProvider.timezone.l10nKey],
        value: settingsProvider.timezone,
      ),
      onValueChanged: settingsProvider.setTimezone,
      items: [
        SearchableListItem(
          label: tSettings.timezone_system,
          value: SettingTimezone.empty,
        ),
        ...SettingTimezone.all.map(
          (timezone) => SearchableListItem(
            label: isLoading ? "..." : _tTimezone![timezone.l10nKey],
            value: timezone,
          ),
        ),
      ],
    );
  }
}
