import 'package:flutter/material.dart';
import 'package:hamewari/l10n/calendar/calendar_localizations.dart';
import 'package:hamewari/ui/form/fields/select.dart';

enum Alarm {
  none,
  atTime,
  fiveMinutesBefore,
  tenMinutesBefore,
  fifteenMinutesBefore,
  thirtyMinutesBefore,
}

class FormAlertSelectField extends StatelessWidget {
  const FormAlertSelectField({
    super.key,
    this.label,
    this.initialValue = Alarm.none,
    this.onChanged,
  });

  final String? label;
  final Alarm initialValue;
  final void Function(Alarm value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final t = CalendarLocalizations.of(context)!;

    return FormSelectField<Alarm>(
      label: label ?? t.new_event_caption_alert,
      initialValue: initialValue,
      onChanged: (value) => onChanged?.call(value),
      items: Alarm.values
          .map((type) => SelectItem(label: t.alarms(type.name), value: type))
          .toList(),
    );
  }
}
