import 'package:flutter/material.dart';
import 'package:hamewari/ui/buttons/button_stack.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';

class CalendarViewSelector extends StatelessWidget {
  const CalendarViewSelector({
    super.key,
    required this.onViewIndexChanged,
    this.selectedViewIndex = 0,
  });

  final void Function(int) onViewIndexChanged;
  final int selectedViewIndex;

  @override
  Widget build(BuildContext context) {
    return ButtonStack(
      onSelectionChanged: onViewIndexChanged,
      size: ButtonStackSize.medium,
      selectedId: selectedViewIndex,
      items: CalendarView.allAsButtonStackItems,
    );
  }
}
