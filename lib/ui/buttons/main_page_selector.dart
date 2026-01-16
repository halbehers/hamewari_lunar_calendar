import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/buttons/button_stack.dart';
import 'package:hamewari/pages/calendar.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:provider/provider.dart';

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
    AppLocalizations t = AppLocalizations.of(context)!;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    void onSelectionChanged(String id) {
      Page newSelectedPage = Page.values.firstWhere((view) => view.name == id);
      context.go('/${newSelectedPage.name}');
    }

    return ButtonStack(
      onSelectionChanged: onSelectionChanged,
      size: ButtonStackSize.large,
      displayCaptions: settingsProvider.displayMenuCaptions,
      selectedId: pageId,
      squared: settingsProvider.displayMenuCaptions,
      items: [
        ButtonStackItem(
          id: "calendar",
          iconPath: IconPath.calendar,
          caption: t.menuCaption_calendar,
        ),
        ButtonStackItem(
          id: "tasks",
          iconPath: IconPath.rows,
          caption: t.menuCaption_tasks,
        ),
        ButtonStackItem(
          id: "settings",
          iconPath: IconPath.gear,
          caption: t.menuCaption_settings,
        ),
      ],
    );
  }
}
