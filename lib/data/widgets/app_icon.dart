import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/enums/enums.dart';

class AppIcon extends StatelessWidget {
  final AppIcons icon;
  final String? customIcon;
  final double size;
  final Color? color;

  const AppIcon(
    this.icon, {
    super.key,
    this.size = 24.0,
    this.color,
    this.customIcon,
  }) : assert(
          icon != AppIcons.custom || customIcon != null,
          'customIcon must not be null if icon is custom',
        );

  @override
  Widget build(BuildContext context) {
    return _buildIcon(customIcon ?? icon.path);
  }

  Widget _buildIcon(String path) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
      );
    } else if (path.startsWith('http')) {
      return Image.network(
        path,
        width: size,
        fit: BoxFit.contain,
        height: size,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error, color: Colors.red, size: size);
        },
      );
    } else {
      return Image.asset(
        path,
        width: size,
        fit: BoxFit.contain,
        height: size,
        color: color,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.error, color: Colors.red, size: size);
        },
      );
    }
  }
}
