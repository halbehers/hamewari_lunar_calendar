import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/theme/h_icon.dart';
import 'package:hamewari/theme/icon_path.dart';

class ButtonStackItem {
  const ButtonStackItem({
    required this.id,
    required this.iconPath,
    this.caption,
  });

  final String id;
  final IconPath iconPath;
  final String? caption;
}

enum ButtonStackSize { small, medium, large }

class ButtonStack extends StatelessWidget {
  const ButtonStack({
    super.key,
    required this.items,
    this.size = ButtonStackSize.medium,
    this.margin,
    required this.onSelectionChanged,
    this.selection,
    this.displayCaptions = false,
    this.squared = false,
  });

  final List<ButtonStackItem> items;
  final ButtonStackSize size;
  final EdgeInsetsGeometry? margin;
  final void Function(String) onSelectionChanged;
  final String? selection;
  final bool displayCaptions;
  final bool squared;

  IconSize getIconSize() {
    switch (size) {
      case ButtonStackSize.small:
        return IconSize.small;
      case ButtonStackSize.medium:
        return IconSize.medium;
      case ButtonStackSize.large:
        return IconSize.large;
    }
  }

  String getSelection() {
    return selection ?? items.first.id;
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Container(
      decoration: BoxDecoration(
        color: appTheme.highlightedBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(squared ? 24.0 : 1000.0),
        ),
        border: BoxBorder.all(color: appTheme.borderColor),
        boxShadow: [
          BoxShadow(
            color: appTheme.shadowColor,
            blurRadius: 7,
            spreadRadius: -3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: margin,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 24),
        child: Wrap(
          spacing: displayCaptions ? 24 : 16,
          children: items
              .map(
                (item) => GestureDetector(
                  onTap: () => onSelectionChanged(item.id),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HIcon(
                        iconPath: item.iconPath,
                        isActive: getSelection() == item.id,
                        size: getIconSize(),
                      ),
                      ...(displayCaptions && item.caption != null
                          ? [
                              Padding(
                                padding: EdgeInsetsGeometry.only(top: 4),
                                child: Text(
                                  item.caption!,
                                  style: getSelection() == item.id
                                      ? appTheme.smallTextSecondary
                                      : appTheme.smallText,
                                ),
                              ),
                            ]
                          : []),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
