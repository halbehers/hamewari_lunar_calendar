import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/theme/icon_path.dart';

enum IconSize {
  small(18), medium(24), large(32);

  const IconSize(this.value);

  final double value;
}

class IconColorMapper extends ColorMapper {
  const IconColorMapper({required this.appTheme, this.isActive = false});

  final AppTheme appTheme;
  final bool isActive;

  @override
  Color substitute(
    String? id,
    String elementName,
    String attributeName,
    Color color,
  ) {
    if (color == const Color(0xFF000000)) {
      return isActive ? appTheme.iconActiveColor : appTheme.iconColor;
    }
    return color;
  }
}

class HIcon extends StatelessWidget {
  const HIcon({super.key, required this.iconPath, this.isActive = false, this.size = IconSize.medium});

  final IconPath iconPath;
  final bool isActive;
  final IconSize size;

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = context.appTheme;

    return SvgPicture.asset(
      iconPath.path,
      width: size.value,
      height: size.value,
      colorMapper: IconColorMapper(appTheme: appTheme, isActive: isActive),
    );
  }
}
