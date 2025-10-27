import 'package:flutter/material.dart';

class ReflectionCard extends StatelessWidget {
  final String date;
  final String title;
  final String emoji;
  final String preview;
  final VoidCallback? onTap;

  const ReflectionCard({
    super.key,
    required this.date,
    required this.title,
    required this.emoji,
    required this.preview,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B6B6B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(emoji, style: const TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D2D2D),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              preview,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B6B6B),
                height: 1.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
