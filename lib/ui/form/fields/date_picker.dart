import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/calendar/date_factory.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/theme/h_icon.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/calendar/year/compact_month.dart';
import 'package:hamewari/ui/form/fields/month_wheel.dart';
import 'package:hamewari/ui/form/fields/time_wheel.dart';
import 'package:hamewari/ui/separator.dart';

import '../../../calendar/date_formatter.dart';

class FormDatePickerField extends StatefulWidget {
  const FormDatePickerField({
    super.key,
    required this.label,
    this.initialValue,
    this.isEndDate = false,
  });

  final String label;
  final Date<dynamic>? initialValue;
  final bool isEndDate;

  @override
  State<FormDatePickerField> createState() => _FormDatePickerFieldState();
}

class _FormDatePickerFieldState extends State<FormDatePickerField> {
  late Date<dynamic> _selectedDate;
  bool _displayDatePicker = false;
  bool _displayTimePicker = false;

  @override
  void initState() {
    super.initState();

    _selectedDate = computeInitialValue();
  }

  Date<dynamic> computeInitialValue() {
    if (widget.initialValue != null) return widget.initialValue!;

    final settingsProvider = SettingsProvider.of(context, listen: false);

    final Date<dynamic> now = DateFactory.buildNow(
      settingsProvider.calendar,
      settingsProvider.timezone,
    );

    final startDate = now.addHours(now.minute == 0 ? 0 : 1).withMinute(0);

    if (widget.isEndDate) {
      return startDate.addMinutes(
        settingsProvider.defaultEventDuration.durationInMinutes,
      );
    }

    return startDate;
  }

  void onDateTap() {
    setState(() {
      if (_displayTimePicker) _displayTimePicker = false;

      _displayDatePicker = !_displayDatePicker;
    });
  }

  void onTimeTap() {
    setState(() {
      if (_displayDatePicker) _displayDatePicker = false;

      _displayTimePicker = !_displayTimePicker;
    });
  }

  void _onDateChanged(Date<dynamic> date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.label, style: appTheme.body),
              Wrap(
                spacing: 8.0,
                children: [
                  _DateButton(
                    date: _selectedDate,
                    onTap: onDateTap,
                    isSelected: _displayDatePicker,
                  ),
                  _TimeButton(
                    date: _selectedDate,
                    onTap: onTimeTap,
                    isSelected: _displayTimePicker,
                  ),
                ],
              ),
            ],
          ),
        ),
        if (_displayDatePicker) ...[
          const Separator(),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: _Calendar(
              date: _selectedDate,
              onDateChanged: _onDateChanged,
            ),
          ),
        ],
        if (_displayTimePicker) ...[
          const Separator(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TimeWheel(
              date: _selectedDate,
              onTimeChanged: _onDateChanged,
            ),
          ),
        ],
      ],
    );
  }
}

class _Calendar extends StatefulWidget {
  const _Calendar({required this.date, this.onDateChanged});

  final Date<dynamic> date;
  final void Function(Date<dynamic> date)? onDateChanged;

  @override
  State<_Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<_Calendar> {
  bool _displayMonthPicker = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _MonthButton(
              date: widget.date,
              onTap: () =>
                  setState(() => _displayMonthPicker = !_displayMonthPicker),
              isSelected: _displayMonthPicker,
            ),
            if (!_displayMonthPicker)
              Wrap(
                spacing: 16.0,
                children: [
                  GestureDetector(
                    onTap: () => widget.onDateChanged?.call(
                      widget.date.subtractMonths(1),
                    ),
                    child: const HIcon(iconPath: IconPath.arrowLeft),
                  ),
                  GestureDetector(
                    onTap: () =>
                        widget.onDateChanged?.call(widget.date.addMonths(1)),
                    child: const HIcon(iconPath: IconPath.arrowRight),
                  ),
                ],
              ),
          ],
        ),
        SizedBox.fromSize(size: const Size.fromHeight(16.0)),
        if (!_displayMonthPicker)
          CompactMonth(
            date: widget.date,
            onDayTap: widget.onDateChanged,
            displayMonthName: false,
            highlightToday: false,
            highlightInitialDate: true,
            verticalGap: 12.0,
          ),
        if (_displayMonthPicker)
          MonthWheel(date: widget.date, onDateChanged: widget.onDateChanged),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.child,
    required this.onTap,
    this.width,
    this.isSelected = false,
    this.selectedStyle,
    this.style,
  });

  final String child;
  final void Function() onTap;
  final double? width;
  final bool isSelected;
  final TextStyle? selectedStyle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: appTheme.backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        child: Text(
          child,
          style: isSelected
              ? (selectedStyle ?? appTheme.secondarySmallText)
              : (style ?? appTheme.smallText),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _DateButton extends StatelessWidget {
  const _DateButton({
    required this.date,
    required this.onTap,
    this.isSelected = false,
  });

  final Date<dynamic> date;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return _Button(
      onTap: onTap,
      isSelected: isSelected,
      child: date.format(
        locale: Localizations.localeOf(context),
        pattern: DateFormatter.yearNumMonthDayPattern,
      ),
    );
  }
}

class _TimeButton extends StatelessWidget {
  const _TimeButton({
    required this.date,
    required this.onTap,
    this.isSelected = false,
  });

  final Date<dynamic> date;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return _Button(
      onTap: onTap,
      width: 60,
      isSelected: isSelected,
      child: date.format(
        locale: Localizations.localeOf(context),
        pattern: DateFormatter.hourMinutesPattern,
      ),
    );
  }
}

class _MonthButton extends StatelessWidget {
  const _MonthButton({
    required this.date,
    required this.onTap,
    this.isSelected = false,
  });

  final Date<dynamic> date;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return _Button(
      onTap: onTap,
      isSelected: isSelected,
      child: date.format(
        locale: Localizations.localeOf(context),
        pattern: DateFormatter.yearMonthPattern,
      ),
      selectedStyle: appTheme.secondaryBody,
      style: appTheme.body,
    );
  }
}
