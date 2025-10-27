import 'package:flutter/material.dart';
import 'package:reflex_app/core/config/theme/app_colors.dart';

class PaginationDots extends StatelessWidget {
  final int currentIndex;
  final int totalCount;

  const PaginationDots({
    super.key,
    required this.currentIndex,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalCount,
        (index) => _buildDot(index == currentIndex),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.paginationActive
            : AppColors.paginationInactive,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
