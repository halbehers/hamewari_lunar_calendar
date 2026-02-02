import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date_factory.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/form/fields/select_field.dart';

class CalendarTypeSelectField extends StatelessWidget {
  const CalendarTypeSelectField({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final t = SettingsLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    return SelectField<DateType>(
      label: label ?? t.calendar_type,
      initialValue: settingsProvider.calendar,
      onValueChanged: settingsProvider.setCalendar,
      items: DateType.values
          .map(
            (type) =>
                SelectItem(label: t.calendar_types(type.name), value: type),
          )
          .toList(),
    );
  }
}
