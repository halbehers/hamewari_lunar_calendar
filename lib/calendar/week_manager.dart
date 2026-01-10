import 'package:flutter/material.dart';
import 'package:hamewari/theme/app_theme.dart';

enum Week {
  starting(1, "Starting"),
  refinement(2, "Refinement"),
  transformation(3, "Transformation"),
  implementation(4, "Implementation");

  const Week(this.weekNumber, this.name);

  final int weekNumber;
  final String name;

  Color getWeekBackgroundColor(AppTheme appTheme) {
    final Map<int, Color> backgroundColors = {
      1: appTheme.startingWeekBackgroundColor,
      2: appTheme.refinementWeekBackgroundColor,
      3: appTheme.transformationWeekBackgroundColor,
      4: appTheme.implementationWeekBackgroundColor,
    };
    return backgroundColors[weekNumber]!;
  }

  Color getWeekColor(AppTheme appTheme) {
    final Map<int, Color> colors = {
      1: appTheme.startingWeekColor,
      2: appTheme.refinementWeekColor,
      3: appTheme.transformationWeekColor,
      4: appTheme.implementationWeekColor,
    };
    return colors[weekNumber]!;
  }
}

class WeekManager {
  WeekManager._privateConstructor();
  static final WeekManager instance = WeekManager._privateConstructor();

  List<Week> get weeks {
    return Week.values;
  }

  Week getWeekByNumber(int weekNumber) {
    return Week.values[weekNumber - 1];
  }
}
