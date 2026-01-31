import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamewari/l10n/calendar/calendar_localizations.dart';
import 'package:hamewari/l10n/settings/settings_localizations.dart';
import 'package:hamewari/l10n/tasks/tasks_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/buttons/button_stack.dart';
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
  const MainPageSelector({
    super.key,
    this.pageId = "calendar",
    this.onAddButtonTap,
  });

  final String pageId;
  final void Function()? onAddButtonTap;

  @override
  Widget build(BuildContext context) {
    final tCalendar = CalendarLocalizations.of(context)!;
    final tSettings = SettingsLocalizations.of(context)!;
    final tTasks = TasksLocalizations.of(context)!;
    final settingsProvider = SettingsProvider.of(context);

    void onSelectionChanged(String id) {
      Page newSelectedPage = Page.values.firstWhere((view) => view.name == id);
      context.go('/${newSelectedPage.name}');
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox.fromSize(size: const Size.square(32)),
        ButtonStack(
          onSelectionChanged: onSelectionChanged,
          size: ButtonStackSize.medium,
          displayCaptions: settingsProvider.displayMenuCaptions,
          selectedId: pageId,
          items: [
            ButtonStackItem(
              id: "calendar",
              iconPath: IconPath.calendar,
              caption: tCalendar.menu_caption,
            ),
            ButtonStackItem(
              id: "tasks",
              iconPath: IconPath.rows,
              caption: tTasks.menu_caption,
            ),
            ButtonStackItem(
              id: "settings",
              iconPath: IconPath.gear,
              caption: tSettings.menu_caption,
            ),
          ],
        ),
        if (onAddButtonTap != null)
          ButtonStack(
            onSelectionChanged: (String _) => onAddButtonTap?.call(),
            size: ButtonStackSize.medium,
            displayCaptions: settingsProvider.displayMenuCaptions,
            selectedId: pageId,
            items: [
              ButtonStackItem(
                id: "add-event",
                iconPath: IconPath.add,
                caption: tCalendar.menu_caption,
              ),
            ],
          ),
        if (onAddButtonTap == null)
          SizedBox.fromSize(size: const Size.square(32)),
      ],
    );
  }
}
