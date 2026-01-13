import 'package:flutter/material.dart';
import 'package:hamewari/theme/app_theme.dart';

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
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  child: Text(title!, style: appTheme.h4),
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
                    ...(item.$1 > 0 ? [SettingSectionSeparator()] : []),
                    Container(
                      padding: EdgeInsets.symmetric(
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

class SettingSectionSeparator extends StatelessWidget {
  const SettingSectionSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Theme.of(context).extension<AppTheme>()!;

    return Container(
      height: 1,
      decoration: BoxDecoration(color: appTheme.borderColor),
    );
  }
}
