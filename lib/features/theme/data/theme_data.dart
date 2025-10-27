import 'package:flutter/material.dart';

class ThemeOption {
  final String name;
  final Color gradientStart;
  final Color gradientEnd;
  final bool isSelected;
  final String image;
  const ThemeOption({
    required this.name,
    required this.gradientStart,
    required this.gradientEnd,
    this.isSelected = false,
    required this.image,
  });

  ThemeOption copyWith({bool? isSelected}) => ThemeOption(
    name: name,
    gradientStart: gradientStart,
    gradientEnd: gradientEnd,
    isSelected: isSelected ?? this.isSelected,
    image: image,
  );
}

class ThemeDataSource {
  static List<ThemeOption> get themes => [
    ThemeOption(
      name: 'Dreamy Clouds',
      gradientStart: const Color(0xFFE8D5FF),
      gradientEnd: const Color(0xFFFFD6E8),
      isSelected: true,
      image: 'assets/images/onboarding1.png',
    ),
    ThemeOption(
      name: 'Peaceful Nature',
      gradientStart: const Color(0xFFA8E6CF),
      gradientEnd: const Color(0xFFD4F1C5),
      image: 'assets/images/onboarding2.png',
    ),
    ThemeOption(
      name: 'Soft Flowers',
      gradientStart: const Color(0xFFFFB3D9),
      gradientEnd: const Color(0xFFFFC3D6),
      image: 'assets/images/onboarding3.png',
    ),
    ThemeOption(
      name: 'Gentle Sunset',
      gradientStart: const Color(0xFFFFC8A8),
      gradientEnd: const Color(0xFFFFE0B3),
      image: 'assets/images/onboarding1.png',
    ),
    ThemeOption(
      name: 'Mystical Light',
      gradientStart: const Color(0xFFB8D9FF),
      gradientEnd: const Color(0xFFE8BFFF),
      image: 'assets/images/onboarding2.png',
    ),
  ];
}
