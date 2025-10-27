import 'package:flutter/material.dart';

class MoodDataPoint {
  final String day;
  final double value;

  const MoodDataPoint({required this.day, required this.value});
}

class MoodDistribution {
  final String mood;
  final double percentage;
  final Color color;

  const MoodDistribution({
    required this.mood,
    required this.percentage,
    required this.color,
  });
}

class StatsDataSource {
  static List<MoodDataPoint> get weeklyMood => const [
    MoodDataPoint(day: 'Mon', value: 7),
    MoodDataPoint(day: 'Tue', value: 6),
    MoodDataPoint(day: 'Wed', value: 9),
    MoodDataPoint(day: 'Thu', value: 6),
    MoodDataPoint(day: 'Fri', value: 8),
    MoodDataPoint(day: 'Sat', value: 7),
    MoodDataPoint(day: 'Sun', value: 9),
  ];

  static List<MoodDistribution> get moodDistribution => const [
    MoodDistribution(
      mood: 'Peaceful',
      percentage: 50.0,
      color: Color(0xFF8B5CF6),
    ),
    MoodDistribution(mood: 'Happy', percentage: 30.0, color: Color(0xFFEC4899)),
    MoodDistribution(
      mood: 'Thoughtful',
      percentage: 20.0,
      color: Color(0xFF89D0FF),
    ),
  ];

  static String get weeklySummary =>
      'This week, you felt peaceful 50% of the time 💙 Keep reflecting and growing 🌱';
}
