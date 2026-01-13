import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleSwitchItem<T> {
  const ToggleSwitchItem({required this.label, required this.value});

  final String label;
  final T value;
}

class ToggleSwitchSetting<T extends Enum> extends StatelessWidget {
  const ToggleSwitchSetting({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    required this.items,
  });

  final String label;
  final T initialValue;
  final void Function(T value) onChanged;
  final List<ToggleSwitchItem<T>> items;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    final int initialLabelIndex = items.indexWhere(
      (item) => item.value == initialValue,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: appTheme.body),
        Padding(
          padding: EdgeInsetsGeometry.only(top: 16.0, bottom: 8.0),
          child: Center(
            child: ToggleSwitch(
              initialLabelIndex: initialLabelIndex,
              totalSwitches: items.length,
              customHeights: items.map((_) => 32.0).toList(),
              // customWidths: items.map((_) => 56.0).toList(),
              cornerRadius: 16.0,
              activeBgColor: [appTheme.secondaryColor],
              activeFgColor: appTheme.invertedTextColor,
              inactiveBgColor: appTheme.backgroundColor,
              inactiveFgColor: appTheme.subduedTextColor,
              animate: true,
              curve: Curves.elasticInOut,
              animationDuration: 200,
              dividerColor: appTheme.borderColor,
              radiusStyle: true,
              labels: items.map((item) => item.label).toList(),
              onToggle: (index) {
                onChanged(items[index!].value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
