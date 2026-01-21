import 'package:flutter/material.dart';
import 'package:hamewari/l10n/app_localizations.dart';
import 'package:hamewari/theme/h_icon.dart';
import 'package:hamewari/theme/icon_path.dart';
import 'package:hamewari/ui/buttons/floating_button.dart';

class TodayButton extends StatelessWidget {
  const TodayButton({super.key, this.margin, this.onTap});

  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return FloatingButton(
      iconPath: IconPath.today,
      caption: t.caption_today,
      iconSize: IconSize.small,
      displayCaptions: true,
      onTap: onTap,
      squared: true,
    );
  }
}
