import 'package:flutter/material.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';

const double hourRowHeight = 32.0;

class Hour extends StatelessWidget {
  const Hour({super.key, required this.hour, this.overlay});

  final int hour;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return SizedBox(
      height: hourRowHeight,
      child: Stack(
        children: [
          Row(
            children: [
              Flexible(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  width: 50,
                  child: Text(
                    overlay == null
                        ? '${(hour == 24 ? 0 : hour).toString().padLeft(2, '0')}:00'
                        : '    ',
                    textAlign: TextAlign.right,
                    style: appTheme.smallText,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(color: appTheme.borderColor),
                ),
              ),
            ],
          ),
          if (overlay != null) overlay!,
        ],
      ),
    );
  }
}
