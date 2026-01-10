import 'package:flutter/material.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    required this.backgroundColor,
    required this.secondaryBackgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.iconActiveColor,
    required this.accentColor,
    required this.accentBackgroundColor,
    required this.shadowColor,
    required this.borderColor,
  });

  final Color backgroundColor;
  final Color secondaryBackgroundColor;
  final Color textColor;
  final Color iconColor;
  final Color iconActiveColor;
  final Color accentColor;
  final Color accentBackgroundColor;
  final Color shadowColor;
  final Color borderColor;

  TextStyle get h1 => TextStyle(color: textColor, fontSize: 28, fontWeight: FontWeight.w700);
  TextStyle get h2 => TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.w700);
  TextStyle get h3 => TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.w700);
  TextStyle get h4 => TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w500);
  TextStyle get body => TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w300);
  TextStyle get smallText => TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w300);
  TextStyle get extraSmallText => TextStyle(color: textColor, fontSize: 10, fontWeight: FontWeight.w300);

  @override
  AppTheme copyWith({
    Color? background,
    Color? secondaryBackground,
    Color? textColor,
    Color? iconColor,
    Color? iconActiveColor,
    Color? accentColor,
    Color? accentBackgroundColor,
    Color? shadowColor,
    Color? borderColor,
  }) {
    return AppTheme(
      backgroundColor: background ?? backgroundColor,
      secondaryBackgroundColor: secondaryBackground ?? secondaryBackgroundColor,
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      iconActiveColor: iconActiveColor ?? this.iconActiveColor,
      accentColor: accentColor ?? this.accentColor,
      accentBackgroundColor:
          accentBackgroundColor ?? this.accentBackgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  AppTheme lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      backgroundColor:
          Color.lerp(backgroundColor, other.backgroundColor, t) ?? Colors.white,
      secondaryBackgroundColor:
          Color.lerp(
            secondaryBackgroundColor,
            other.secondaryBackgroundColor,
            t,
          ) ??
          Colors.white,
      textColor: Color.lerp(textColor, other.textColor, t) ?? Colors.black,
      iconColor: Color.lerp(iconColor, other.iconColor, t) ?? Colors.black,
      iconActiveColor:
          Color.lerp(iconActiveColor, other.iconActiveColor, t) ?? Colors.black,
      accentColor:
          Color.lerp(accentColor, other.accentColor, t) ?? Colors.black,
      accentBackgroundColor:
          Color.lerp(accentBackgroundColor, other.accentBackgroundColor, t) ??
          Colors.black,
      shadowColor:
          Color.lerp(shadowColor, other.shadowColor, t) ?? Colors.black,
      borderColor:
          Color.lerp(borderColor, other.borderColor, t) ?? Colors.black,
    );
  }
}
