import 'package:flutter/material.dart';
import 'package:reflex_app/core/config/theme/app_colors.dart';

class MoodDonutChart extends StatelessWidget {
  final List<({String mood, double percentage, Color color})> distribution;

  const MoodDonutChart({super.key, required this.distribution});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Chart
          SizedBox(
            height: 150,
            child: CustomPaint(painter: DonutChartPainter(distribution)),
          ),
          const SizedBox(height: 16),
          // Legend
          Wrap(
            spacing: 20,
            alignment: WrapAlignment.center,
            children: distribution.map((item) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: item.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    item.mood,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final List<({String mood, double percentage, Color color})> distribution;
  final double holeRadius = 50.0;

  DonutChartPainter(this.distribution);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 60.0;
    final totalPercentage = distribution.fold<double>(
      0,
      (sum, item) => sum + item.percentage,
    );
    var startAngle = -90 * (3.14159 / 180); // Start from top

    for (var item in distribution) {
      final sweepAngle =
          (item.percentage / totalPercentage) * 360 * (3.14159 / 180);

      final paint = Paint()
        ..color = item.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 30
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
