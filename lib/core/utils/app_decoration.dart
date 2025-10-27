import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration get gradientButtonDecoration {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFF8B5CF6),
          Color(0xFFEC4899),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(28),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF8B5CF6).withOpacity(0.3),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  static BoxDecoration gradientDecoration({
    List<Color> colors = const [
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
    ],
    double borderRadius = 28,
    double shadowBlurRadius = 12,
    Offset shadowOffset = const Offset(0, 6),
  }) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: colors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: colors.first.withOpacity(0.3),
          blurRadius: shadowBlurRadius,
          offset: shadowOffset,
        ),
      ],
    );
  }
}