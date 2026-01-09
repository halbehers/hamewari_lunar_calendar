import 'package:flutter/material.dart';
import 'package:hamewari/components/buttons/button_stack.dart';
import 'package:hamewari/pages/calendar.dart';
import 'package:hamewari/theme/icon_path.dart';

class CalendarViewSelector extends StatelessWidget {
  const CalendarViewSelector({
    super.key,
    required this.onViewChanged,
    this.selectedView,
  });

  final void Function(CalendarView) onViewChanged;
  final CalendarView? selectedView;

  void onSelectionChanged(String id) {
    CalendarView newSelectedView = CalendarView.values.firstWhere(
      (view) => view.name == id,
    );
    onViewChanged(newSelectedView);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonStack(
      onSelectionChanged: onSelectionChanged,
      size: ButtonStackSize.small,
      defaultSelection: selectedView?.name,
      items: [
        ButtonStackItem(id: "year", iconPath: IconPath.largeGrid),
        ButtonStackItem(id: "month", iconPath: IconPath.grid),
        ButtonStackItem(id: "week", iconPath: IconPath.columns),
      ],
    );
  }
}
