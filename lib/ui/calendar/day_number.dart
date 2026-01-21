import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_motion.dart';

enum DayVisibility { hidden, visible }

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
    this.onTap,
    this.visibility = DayVisibility.visible,
  });

  final int day;
  final bool isActive;
  final bool isSelected;
  final bool hasEvent;
  final double size;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;
  final VoidCallback? onTap;
  final DayVisibility visibility;

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

    final Color backgroundColor = isActive
        ? appTheme.accentColor
        : isSelected
        ? appTheme.borderColor
        : Colors.transparent;

    final TextStyle resolvedTextStyle = isActive
        ? (activeTextStyle ?? appTheme.invertedBoldSmallText)
        : (textStyle ?? appTheme.smallText);

    final scale = isActive
        ? (isSelected ? 1.0 : 0.9)
        : (isSelected ? 1.0 : 0.6);

    if (visibility == DayVisibility.hidden) {
      return SizedBox.fromSize(size: Size.square(size));
    }

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            HapticFeedback.selectionClick();
            onTap?.call();
          },
          splashFactory: InkRipple.splashFactory,
          splashColor: backgroundColor.withValues(alpha: 0.25),
          highlightColor: backgroundColor.withValues(alpha: 0.1),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedScale(
                scale: scale,
                duration: CalendarMotion.selectionDuration,
                curve: CalendarMotion.selectionCurve,
                child: AnimatedContainer(
                  duration: CalendarMotion.selectionDuration,
                  curve: CalendarMotion.selectionCurve,
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: CalendarMotion.selectionDuration,
                curve: CalendarMotion.selectionCurve,
                style: resolvedTextStyle,
                child: Text(day.toString()),
              ),

              if (hasEvent)
                Positioned(bottom: 0, right: 8, child: buildDot(appTheme)),
            ],
          ),
        ),
      ),
    );
  }
}
