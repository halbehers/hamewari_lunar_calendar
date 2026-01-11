import 'dart:ui';

import 'package:hamewari/theme/app_theme.dart';

enum Month {
  magnetic(1, "Magnetic Moon"),
  lunar(2, "Lunar Moon"),
  electric(3, "Electric Moon"),
  selfExistent(4, "Self-Existent Moon"),
  harmonic(5, "Harmonic Moon"),
  rhythmic(6, "Rhythmic Moon"),
  resonant(7, "Resonant Moon"),
  galactic(8, "Galactic Moon"),
  solar(9, "Solar Moon"),
  planetary(10, "Planetary Moon"),
  spectral(11, "Spectral Moon"),
  crystal(12, "Crystal Moon"),
  cosmic(13, "Cosmic Moon");

  const Month(this.monthNumber, this.name);

  final int monthNumber;
  final String name;
}

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

class CalendarManager {
  CalendarManager._privateConstructor();
  static final CalendarManager instance = CalendarManager._privateConstructor();

  List<Month> get months {
    return Month.values;
  }

  Month getMonthByNumber(int monthNumber) {
    return Month.values[monthNumber - 1];
  }

  List<Week> get weeks {
    return Week.values;
  }

  Week getWeekByNumber(int weekNumber) {
    return Week.values[weekNumber - 1];
  }
}
