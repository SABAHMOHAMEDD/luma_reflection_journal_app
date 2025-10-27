import 'package:flutter/material.dart';
import 'package:reflex_app/core/config/theme/app_colors.dart';
import 'package:reflex_app/core/extensions/context.dart';
import 'package:reflex_app/core/utils/app_decoration.dart';
import 'package:reflex_app/core/widgets/icons/floating_icon.dart';
import 'package:reflex_app/features/onBoarding/data/onboarding_data.dart';
import 'package:reflex_app/features/onBoarding/presentation/widgets/pagination_dots.dart';

class OnboardingSlide extends StatelessWidget {
  final OnboardingData data;
  final VoidCallback? onButtonPressed;
  final int currentPage;
  final List<OnboardingData> slides;

  const OnboardingSlide({
    super.key,
    required this.data,
    this.onButtonPressed,
    required this.currentPage,
    required this.slides,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,

      // color: AppColors.backgroundDark,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            data.backgroundAsset,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Content
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: FloatingIcon(iconAsset: data.mascotAsset, size: 100),
                ),

                // Mascot Container with animation
                const SizedBox(height: 40),

                // Title with emoji support
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: _parseTitle(data.title),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      height: 1.2,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    data.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 60),

                // Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildButton(data.buttonText),
                ),
                const SizedBox(height: 40),

                // Pagination Dots
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: PaginationDots(
                    currentIndex: currentPage,
                    totalCount: slides.length,
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: AppDecorations.gradientButtonDecoration,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  List<TextSpan> _parseTitle(String title) {
    final List<TextSpan> spans = [];
    final List<String> parts = title.split(' ');

    for (int i = 0; i < parts.length; i++) {
      final part = parts[i];

      // Check if part contains emoji or special characters
      if (part.contains('🌿') || part.contains('🌱')) {
        spans.add(
          TextSpan(
            text: part,
            style: const TextStyle(color: AppColors.accentTeal),
          ),
        );
      } else {
        spans.add(TextSpan(text: part));
      }

      if (i < parts.length - 1) {
        spans.add(const TextSpan(text: ' '));
      }
    }

    return spans;
  }
}
