import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/theme/h_icon.dart';
import 'package:hamewari/theme/icon_path.dart';

class DropdownSettingItem<T> {
  const DropdownSettingItem({required this.label, required this.value});

  final String label;
  final T value;
}

class DropdownSetting<T> extends StatelessWidget {
  const DropdownSetting({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    required this.items,
  });

  final String label;
  final T initialValue;
  final void Function(T value) onChanged;
  final List<DropdownSettingItem<T>> items;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16.0,
      children: [
        Flexible(
          flex: 2,
          child: Text(label, style: appTheme.body, overflow: TextOverflow.clip),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: DropdownButton<T>(
            value: initialValue,
            isExpanded: true,
            icon: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: HIcon(
                iconPath: IconPath.arrowBottom,
                size: IconSize.small,
              ),
            ),
            underline: Container(height: 2, color: appTheme.borderColor),
            borderRadius: BorderRadius.circular(16.0),
            dropdownColor: appTheme.highlightedBackgroundColor,
            items: items
                .map(
                  (item) => DropdownMenuItem<T>(
                    value: item.value,
                    child: Text(item.label, style: appTheme.body),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
