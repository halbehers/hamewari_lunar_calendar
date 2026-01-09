import 'package:flutter/material.dart';
import 'package:hamewari/components/buttons/main_page_selector.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      body: Center(child: Text("Settings page")),
      floatingActionButton: MainPageSelector(pageId: "settings"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
