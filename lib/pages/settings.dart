import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/settings/bool_setting.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    AppLocalizations t = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Text(t.settings_title, style: appTheme.h1),
        ),
        backgroundColor: appTheme.backgroundColor,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 32, vertical: 16),
        child: Column(children: [BoolSetting()]),
      ),
      floatingActionButton: MainPageSelector(pageId: "settings"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
