import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/theme/h_icon.dart';
import 'package:hamewari/theme/icon_path.dart';

class ButtonStackItem {
  const ButtonStackItem({required this.id, required this.iconPath});

  final String id;
  final IconPath iconPath;
}

enum ButtonStackSize { small, medium, large }

class ButtonStack extends StatefulWidget {
  const ButtonStack({
    super.key,
    required this.items,
    this.size = ButtonStackSize.medium,
    this.margin,
    required this.onSelectionChanged,
    this.defaultSelection,
  });

  final List<ButtonStackItem> items;
  final ButtonStackSize size;
  final EdgeInsetsGeometry? margin;
  final void Function(String) onSelectionChanged;
  final String? defaultSelection;

  @override
  State<ButtonStack> createState() => _ButtonStackState();
}

class _ButtonStackState extends State<ButtonStack> {
  String? selection;

  IconSize getIconSize() {
    switch (widget.size) {
      case ButtonStackSize.small:
        return IconSize.small;
      case ButtonStackSize.medium:
        return IconSize.medium;
      case ButtonStackSize.large:
        return IconSize.large;
    }
  }

  String getSelection() {
    return selection ?? widget.defaultSelection ?? widget.items.first.id;
  }

  void onSelectionChanged(String id) {
    setState(() {
      selection = id;
    });
    widget.onSelectionChanged(id);
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Container(
      decoration: BoxDecoration(
        color: appTheme.secondaryBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
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
      margin: widget.margin,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 24),
        child: Wrap(
          spacing: 16,
          children: widget.items
              .map(
                (item) => GestureDetector(
                  onTap: () => onSelectionChanged(item.id),
                  child: HIcon(
                    iconPath: item.iconPath,
                    isActive: getSelection() == item.id,
                    size: getIconSize(),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
