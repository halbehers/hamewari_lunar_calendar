import 'package:flutter/material.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/form/fields/select_field.dart';

class DefaultEventDurationSelectField extends StatelessWidget {
  const DefaultEventDurationSelectField({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final t = SettingsLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return SelectField<DefaultEventDuration>(
      label: label ?? t.default_event_duration,
      initialValue: settingsProvider.defaultEventDuration,
      onValueChanged: settingsProvider.setDefaultEventDuration,
      items: DefaultEventDuration.values
          .map(
            (type) => SelectItem(
              label: t.default_event_durations(type.name),
              value: type,
            ),
          )
          .toList(),
    );
  }
}
