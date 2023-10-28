import 'package:flutter/material.dart';
import 'package:mobile_opservapp/lib.dart';

class BannerStyle {
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Duration duration;

  const BannerStyle({
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.duration,
  });

  factory BannerStyle.success() => BannerStyle(
        backgroundColor: const Color(0xFFDEE3F2),
        textColor: Colors.grey[800]!,
        icon: Icons.check_circle_outline,
        duration: const Duration(seconds: 3),
      );

  factory BannerStyle.error() => BannerStyle(
        backgroundColor: const Color(0xFFE8D7D7),
        textColor: Colors.grey[800]!,
        icon: Icons.error_outline,
        duration: const Duration(seconds: 3),
      );
  factory BannerStyle.warning() => BannerStyle(
        backgroundColor: const Color(0xFFE8D7D7),
        textColor: Colors.grey[800]!,
        icon: Icons.warning_amber_outlined,
        duration: const Duration(seconds: 3),
      );

  factory BannerStyle.info() => BannerStyle(
        backgroundColor: const Color(0xFFE8D7D7),
        textColor: Colors.grey[800]!,
        icon: Icons.info_outline,
        duration: const Duration(seconds: 3),
      );

  factory BannerStyle.fromType(BannerType type) {
    return <BannerType, BannerStyle>{
      BannerType.success: BannerStyle.success(),
      BannerType.error: BannerStyle.error(),
      BannerType.info: BannerStyle.info(),
      BannerType.warning: BannerStyle.warning(),
    }[type]!;
  }
}
