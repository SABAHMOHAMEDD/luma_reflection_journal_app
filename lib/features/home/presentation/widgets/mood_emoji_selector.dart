import 'package:flutter/material.dart';

class MoodEmojiSelector extends StatelessWidget {
  final String? selectedMood;
  final Function(String mood) onMoodSelected;

  const MoodEmojiSelector({
    super.key,
    this.selectedMood,
    required this.onMoodSelected,
  });

  static const List<String> moods = [
    '😊',
    '🙂',
    '😐',
    '😰',
    '😡',
    '🤬',
    '😕',
    '🙄',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'How are you feeling?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D2D2D),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: moods.map((emoji) {
            final isSelected = selectedMood == emoji;
            return GestureDetector(
              onTap: () => onMoodSelected(emoji),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF8B5CF6).withOpacity(0.1)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: const Color(0xFF8B5CF6), width: 2)
                      : null,
                ),
                child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 28)),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

