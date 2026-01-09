import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamewari/pages/calendar.dart';
import 'package:hamewari/pages/settings.dart';
import 'package:hamewari/pages/tasks.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/theme/theme_colors.dart';

void main() {
  runApp(const MyApp());
}

AppTheme lightAppTheme = AppTheme(
  backgroundColor: ThemeColors.grey[100]!,
  secondaryBackgroundColor: ThemeColors.white,
  textColor: ThemeColors.grey[600]!,
  iconColor: ThemeColors.grey[500]!,
  iconActiveColor: ThemeColors.turquoise[500]!,
  accentColor: ThemeColors.yellow[500]!,
  accentBackgroundColor: ThemeColors.yellow[300]!,
  shadowColor: ThemeColors.grey[200]!,
  borderColor: ThemeColors.grey[200]!,
);

AppTheme darkAppTheme = AppTheme(
  backgroundColor: ThemeColors.grey[600]!,
  secondaryBackgroundColor: ThemeColors.grey[500]!,
  textColor: ThemeColors.white,
  iconColor: ThemeColors.grey[100]!,
  iconActiveColor: ThemeColors.turquoise[200]!,
  accentColor: ThemeColors.yellow[100]!,
  accentBackgroundColor: ThemeColors.yellow[500]!,
  shadowColor: ThemeColors.grey[400]!,
  borderColor: ThemeColors.grey[400]!,
);

extension BuildContextExtension on BuildContext {
  AppTheme get appTheme {
    return Theme.of(this).extension<AppTheme>()!;
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => CalendarPage()),
    GoRoute(path: '/calendar', builder: (context, state) => CalendarPage()),
    GoRoute(path: '/tasks', builder: (context, state) => TasksPage()),
    GoRoute(path: '/settings', builder: (context, state) => SettingsPage()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hamewari Lunar Calendar',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: "Brandon",
        primaryColor: ThemeColors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: ThemeColors.grey[600], fontSize: 28),
          headlineMedium: TextStyle(color: ThemeColors.grey[600], fontSize: 24),
          headlineSmall: TextStyle(color: ThemeColors.grey[600], fontSize: 20),
          bodyLarge: TextStyle(color: ThemeColors.grey[600], fontSize: 18),
          bodyMedium: TextStyle(color: ThemeColors.grey[600], fontSize: 16),
          bodySmall: TextStyle(color: ThemeColors.grey[600], fontSize: 12),
          labelLarge: TextStyle(color: ThemeColors.grey[600], fontSize: 12),
          labelMedium: TextStyle(color: ThemeColors.grey[600], fontSize: 11),
          labelSmall: TextStyle(color: ThemeColors.grey[600], fontSize: 10),
        ),
        extensions: <ThemeExtension<dynamic>>[lightAppTheme],
      ),
      darkTheme: ThemeData(
        fontFamily: "Brandon",
        primaryColor: ThemeColors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: ThemeColors.white, fontSize: 28),
          headlineMedium: TextStyle(color: ThemeColors.white, fontSize: 24),
          headlineSmall: TextStyle(color: ThemeColors.white, fontSize: 20),
          bodyLarge: TextStyle(color: ThemeColors.white, fontSize: 18),
          bodyMedium: TextStyle(color: ThemeColors.white, fontSize: 16),
          bodySmall: TextStyle(color: ThemeColors.white, fontSize: 12),
          labelLarge: TextStyle(color: ThemeColors.white, fontSize: 12),
          labelMedium: TextStyle(color: ThemeColors.white, fontSize: 11),
          labelSmall: TextStyle(color: ThemeColors.white, fontSize: 10),
        ),
        extensions: <ThemeExtension<dynamic>>[darkAppTheme],
      ),
      routerConfig: _router,
      debugShowMaterialGrid: false,
    );
  }
}
