import 'package:flutter/material.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      body: Center(child: Text("Tasks page")),
      floatingActionButton: MainPageSelector(pageId: "tasks"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
