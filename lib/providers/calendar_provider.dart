import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:provider/provider.dart';

typedef SelectViewCallback =
    void Function({required int viewIndex, Date<dynamic>? date, bool? animate});

typedef SelectDateCallback = void Function({required Date<dynamic> date});

typedef UpdateBackButtonCallback = void Function(CalendarHeaderBackButton?);

class CalendarProvider {
  CalendarProvider({
    required this.selectView,
    required this.selectDate,
    required this.updateBackButton,
  });

  final SelectViewCallback selectView;
  final SelectDateCallback selectDate;
  final UpdateBackButtonCallback updateBackButton;

  static CalendarProvider of(BuildContext context, {bool listen = true}) =>
      Provider.of<CalendarProvider>(context, listen: listen);

  static Provider<CalendarProvider> create({
    required Widget child,
    required SelectViewCallback selectView,
    required SelectDateCallback selectDate,
    required UpdateBackButtonCallback updateBackButton,
  }) {
    return Provider<CalendarProvider>(
      create: (_) => CalendarProvider(
        selectView: selectView,
        selectDate: selectDate,
        updateBackButton: updateBackButton,
      ),
      child: child,
    );
  }
}
