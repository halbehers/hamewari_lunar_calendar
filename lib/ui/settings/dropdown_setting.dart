import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/theme/h_icon.dart';
import 'package:hamewari/theme/icon_path.dart';

class DropdownSettingItem<T> {
  const DropdownSettingItem({required this.label, required this.value});

  final String label;
  final T? value;
}

class DropdownSetting<T> extends StatelessWidget {
  const DropdownSetting({
    super.key,
    required this.label,
    this.initialValue,
    this.notSelectedLabel,
    required this.onChanged,
    required this.items,
  });

  final String label;
  final T? initialValue;
  final String? notSelectedLabel;
  final void Function(T? value) onChanged;
  final List<DropdownSettingItem<T>> items;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: appTheme.body),
        DropdownButton<T>(
          value: initialValue,
          icon: HIcon(iconPath: IconPath.arrowBottom),
          underline: Container(height: 2, color: appTheme.borderColor),
          borderRadius: BorderRadius.circular(16.0),
          dropdownColor: appTheme.highlightedBackgroundColor,
          items: [
            ...(notSelectedLabel != null
                ? [
                    DropdownMenuItem<T>(
                      value: null,
                      child: Text(notSelectedLabel!, style: appTheme.body),
                    ),
                  ]
                : []),
            ...items.map(
              (item) => DropdownMenuItem<T>(
                value: item.value,
                child: Text(item.label, style: appTheme.body),
              ),
            ),
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
