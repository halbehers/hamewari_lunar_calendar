import 'package:flutter/material.dart';
import 'package:hamewari/components/buttons/calendar_view_selector.dart';
import 'package:hamewari/pages/calendar.dart';
import 'package:hamewari/theme/app_theme.dart';

class CalendarHeader extends StatelessWidget implements PreferredSizeWidget {
  const CalendarHeader({
    super.key,
    this.selectedView,
    required this.onViewChanged,
  });

  final CalendarView? selectedView;
  final void Function(CalendarView) onViewChanged;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Theme.of(context).extension<AppTheme>()!;

    return AppBar(
      backgroundColor: appTheme.backgroundColor,
      flexibleSpace: Container(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 32,
              vertical: 24,
            ),
            child: CalendarViewSelector(
              onViewChanged: onViewChanged,
              selectedView: selectedView,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size(400, 70);
}
