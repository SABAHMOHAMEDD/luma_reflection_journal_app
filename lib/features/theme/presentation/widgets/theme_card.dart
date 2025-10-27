import 'package:flutter/material.dart';

class ThemeCard extends StatelessWidget {
  final String name;
  final String image;
  final Color gradientStart;
  final Color gradientEnd;
  final bool isSelected;
  final VoidCallback onTap;

  const ThemeCard({
    super.key,
    required this.name,
    required this.image,
    required this.gradientStart,
    required this.gradientEnd,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [gradientStart, gradientEnd],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: gradientStart.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            // Theme name at bottom
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            // Selected indicator
            if (isSelected)
              const Positioned(
                top: 12,
                right: 12,
                child: Icon(
                  Icons.check_circle,
                  color: Color(0xFF8B5CF6),
                  size: 28,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
