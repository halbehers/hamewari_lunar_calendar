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
  secondaryAccentColor: ThemeColors.purple[500]!,
  secondaryAccentBackgroundColor: ThemeColors.purple[300]!,
  shadowColor: ThemeColors.grey[200]!,
  borderColor: ThemeColors.grey[200]!,
  startingWeekColor: ThemeColors.red[500]!,
  startingWeekBackgroundColor: ThemeColors.red[300]!,
  refinementWeekColor: ThemeColors.grey[400]!,
  refinementWeekBackgroundColor: ThemeColors.grey[200]!,
  transformationWeekColor: ThemeColors.blue[400]!,
  transformationWeekBackgroundColor: ThemeColors.blue[200]!,
  implementationWeekColor: ThemeColors.yellow[500]!,
  implementationWeekBackgroundColor: ThemeColors.yellow[300]!,
);

AppTheme darkAppTheme = AppTheme(
  backgroundColor: ThemeColors.grey[600]!,
  secondaryBackgroundColor: ThemeColors.grey[700]!,
  textColor: ThemeColors.white,
  iconColor: ThemeColors.grey[100]!,
  iconActiveColor: ThemeColors.turquoise[200]!,
  accentColor: ThemeColors.yellow[100]!,
  accentBackgroundColor: ThemeColors.yellow[500]!,
  secondaryAccentColor: ThemeColors.purple[300]!,
  secondaryAccentBackgroundColor: ThemeColors.purple[500]!,
  shadowColor: ThemeColors.grey[400]!,
  borderColor: ThemeColors.grey[400]!,
  startingWeekColor: ThemeColors.red[300]!,
  startingWeekBackgroundColor: ThemeColors.red[500]!,
  refinementWeekColor: ThemeColors.grey[200]!,
  refinementWeekBackgroundColor: ThemeColors.grey[400]!,
  transformationWeekColor: ThemeColors.blue[200]!,
  transformationWeekBackgroundColor: ThemeColors.blue[400]!,
  implementationWeekColor: ThemeColors.yellow[300]!,
  implementationWeekBackgroundColor: ThemeColors.yellow[500]!,
);

extension BuildContextExtension on BuildContext {
  AppTheme get appTheme {
    return Theme.of(this).extension<AppTheme>()!;
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => CalendarPage()),
    GoRoute(
      path: '/calendar',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: CalendarPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(
                curve: Curves.easeInOutCirc,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/tasks',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: TasksPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(
                curve: Curves.easeInOutCirc,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: SettingsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(
                curve: Curves.easeInOutCirc,
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
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
        extensions: <ThemeExtension<dynamic>>[lightAppTheme],
      ),
      darkTheme: ThemeData(
        fontFamily: "Brandon",
        extensions: <ThemeExtension<dynamic>>[darkAppTheme],
      ),
      routerConfig: _router,
      debugShowMaterialGrid: false,
    );
  }
}
