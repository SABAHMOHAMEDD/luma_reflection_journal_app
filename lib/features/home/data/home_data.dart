class ReflectionEntry {
  final String date;
  final String title;
  final String emoji;
  final String preview;
  final String fullContent;

  const ReflectionEntry({
    required this.date,
    required this.title,
    required this.emoji,
    required this.preview,
    required this.fullContent,
  });
}

class HomeDataSource {
  static List<ReflectionEntry> get reflections => const [
    ReflectionEntry(
      date: 'Apr 28, 2025',
      title: 'Moments of Reflection',
      emoji: '🤔',
      preview:
          'As I sit here with my thoughts, I am reminded of the beauty and complexity of',
      fullContent:
          'As I sit here with my thoughts, I am reminded of the beauty and complexity of life. Each moment holds within it a thousand untold stories, waiting patiently to be discovered.',
    ),
    ReflectionEntry(
      date: 'Apr 26, 2025',
      title: 'Gratitude Today',
      emoji: '😊',
      preview:
          'Today I\'m grateful for the small things - morning coffee, sunshine through the',
      fullContent:
          'Today I\'m grateful for the small things - morning coffee, sunshine through the window, a warm embrace from a loved one. These moments remind me of the abundance in simplicity.',
    ),
    ReflectionEntry(
      date: 'Apr 24, 2025',
      title: 'Processing Emotions',
      emoji: '😟',
      preview:
          'Sometimes it\'s okay to not be okay. Today was challenging but I\'m learning...',
      fullContent:
          'Sometimes it\'s okay to not be okay. Today was challenging but I\'m learning to sit with my feelings, acknowledge them, and let them pass through me. This too shall pass.',
    ),
  ];
}
