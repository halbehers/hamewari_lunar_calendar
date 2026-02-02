import 'package:flutter/material.dart';
import 'package:hamewari/l10n/calendar/calendar_localizations.dart';
import 'package:hamewari/ui/form/fields/select_field.dart';

enum Alarm {
  none,
  atTime,
  fiveMinutesBefore,
  tenMinutesBefore,
  fifteenMinutesBefore,
  thirtyMinutesBefore,
}

class AlertSelectField extends StatelessWidget {
  const AlertSelectField({
    super.key,
    this.label,
    this.initialValue = Alarm.none,
    this.onValueChanged,
  });

  final String? label;
  final Alarm initialValue;
  final void Function(Alarm value)? onValueChanged;

  @override
  Widget build(BuildContext context) {
    final t = CalendarLocalizations.of(context)!;

    return SelectField<Alarm>(
      label: label ?? t.new_event_caption_alert,
      initialValue: initialValue,
      onValueChanged: (value) => onValueChanged?.call(value),
      items: Alarm.values
          .map((type) => SelectItem(label: t.alarms(type.name), value: type))
          .toList(),
    );
  }
}
