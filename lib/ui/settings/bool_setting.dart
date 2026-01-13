import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

class BoolSetting extends StatelessWidget {
  const BoolSetting({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  final String label;
  final bool initialValue;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: appTheme.body),
        Switch(
          value: initialValue,
          activeThumbColor: appTheme.secondaryColor,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
