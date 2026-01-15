import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

class DayNumber extends StatelessWidget {
  const DayNumber({
    super.key,
    required this.day,
    this.isActive = false,
    this.isSelected = false,
    this.hasEvent = false,
    this.size = 20,
    this.textStyle,
    this.activeTextStyle,
  });

  final int day;
  final bool isActive;
  final bool isSelected;
  final bool hasEvent;
  final double size;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;

  Widget buildDot(AppTheme appTheme) {
    return Container(
      width: 2,
      height: 2,
      decoration: BoxDecoration(
        color: appTheme.secondaryAccentColor,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: isActive || isSelected
              ? BoxDecoration(
                  color: isActive ? appTheme.accentColor : appTheme.borderColor,
                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                )
              : null,
          child: Center(
            child: Text(
              day.toString(),
              style: (isActive
                  ? activeTextStyle ?? appTheme.invertedBoldSmallText
                  : textStyle ?? appTheme.smallText),
            ),
          ),
        ),
        ...(hasEvent
            ? [Positioned(bottom: 0, right: 8, child: buildDot(appTheme))]
            : []),
      ],
    );
  }
}
