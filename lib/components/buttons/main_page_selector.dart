import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamewari/components/buttons/button_stack.dart';
import 'package:hamewari/pages/calendar.dart';
import 'package:hamewari/theme/icon_path.dart';

enum Page {
  calendar(CalendarPage()),
  tasks(Placeholder()),
  settings(Placeholder());

  const Page(this.widget);

  final Widget widget;
}

class MainPageSelector extends StatelessWidget {
  const MainPageSelector({super.key, this.pageId = "calendar"});

  final String pageId;

  @override
  Widget build(BuildContext context) {
    void onSelectionChanged(String id) {
      Page newSelectedPage = Page.values.firstWhere((view) => view.name == id);
      context.go('/${newSelectedPage.name}');
    }

    return ButtonStack(
      onSelectionChanged: onSelectionChanged,
      size: ButtonStackSize.large,
      defaultSelection: pageId,
      items: [
        ButtonStackItem(id: "calendar", iconPath: IconPath.calendar),
        ButtonStackItem(id: "tasks", iconPath: IconPath.rows),
        ButtonStackItem(id: "settings", iconPath: IconPath.gear),
      ],
    );
  }
}
