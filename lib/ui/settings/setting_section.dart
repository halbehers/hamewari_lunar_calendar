import 'package:flutter/material.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/separator.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({super.key, this.title, required this.items});

  final String? title;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Theme.of(context).extension<AppTheme>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(title != null
            ? [
                Padding(
                  padding: const EdgeInsetsGeometry.symmetric(vertical: 16),
                  child: Text(title!, style: appTheme.subduedH4),
                ),
              ]
            : []),
        Container(
          decoration: BoxDecoration(
            color: appTheme.highlightedBackgroundColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              ...items.indexed.map<Widget>(
                (item) => Column(
                  children: [
                    ...(item.$1 > 0 ? [const Separator()] : []),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24.0,
                      ),
                      child: item.$2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
