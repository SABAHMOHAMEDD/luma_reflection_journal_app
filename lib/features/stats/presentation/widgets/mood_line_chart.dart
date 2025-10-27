import 'package:flutter/material.dart';

class MoodLineChart extends StatelessWidget {
  final List<({String day, double value})> dataPoints;

  const MoodLineChart({super.key, required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    final chartHeight = 150.0;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Y-axis labels
          SizedBox(
            width: 40,
            height: chartHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '12',
                  style: TextStyle(fontSize: 10, color: Color(0xFF9B9B9B)),
                ),
                const Text(
                  '0',
                  style: TextStyle(fontSize: 10, color: Color(0xFF9B9B9B)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Chart area
          Expanded(
            child: SizedBox(
              height: chartHeight,
              child: CustomPaint(
                painter: MoodChartPainter(dataPoints),
                child: Stack(
                  children: [
                    // Labels at bottom
                    Positioned(
                      bottom: -20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: dataPoints.map((point) {
                          return Text(
                            point.day,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFF9B9B9B),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoodChartPainter extends CustomPainter {
  final List<({String day, double value})> dataPoints;

  MoodChartPainter(this.dataPoints);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8B5CF6)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final maxValue = dataPoints
        .map((e) => e.value)
        .reduce((a, b) => a > b ? a : b);
    final minValue = dataPoints
        .map((e) => e.value)
        .reduce((a, b) => a < b ? a : b);
    final range = maxValue - minValue;

    final double stepX = size.width / (dataPoints.length - 1);
    final double stepY = size.height / range;

    for (int i = 0; i < dataPoints.length; i++) {
      final x = i * stepX;
      final y = size.height - (dataPoints[i].value - minValue) * stepY;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // Draw point
      canvas.drawCircle(
        Offset(x, y),
        3,
        Paint()
          ..color = const Color(0xFF8B5CF6)
          ..style = PaintingStyle.fill,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
