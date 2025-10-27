import 'package:flutter/material.dart';
import 'package:reflex_app/features/home/data/home_data.dart';
import 'package:reflex_app/features/home/presentation/widgets/action_button.dart';
import 'package:reflex_app/features/home/presentation/widgets/mood_emoji_selector.dart';

class AddThoughtPage extends StatefulWidget {
  final ReflectionEntry? entryToEdit;

  const AddThoughtPage({super.key, this.entryToEdit});

  @override
  State<AddThoughtPage> createState() => _AddThoughtPageState();
}

class _AddThoughtPageState extends State<AddThoughtPage> {
  late final TextEditingController _textController;
  String? _selectedMood;
  late final bool _isEditMode;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.entryToEdit != null;
    _textController = TextEditingController(
      text: widget.entryToEdit?.fullContent ?? '',
    );
    _selectedMood = widget.entryToEdit?.emoji;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write something before saving')),
      );
      return;
    }

    // TODO: Implement actual save functionality
    if (_isEditMode) {
      // Update existing entry
      debugPrint('Updating entry');
    } else {
      // Create new entry
      debugPrint('Creating new entry');
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFE8BFFF),
              const Color(0xFFFFB3D9),
              const Color(0xFFB8D9FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF2D2D2D),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    GestureDetector(
                      onTap: _onSave,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Text Input Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _textController,
                          maxLines: 10,
                          minLines: 6,
                          decoration: const InputDecoration(
                            hintText: 'Write what\'s on your mind...',
                            hintStyle: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2D2D2D),
                            height: 1.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Mood Selector Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: MoodEmojiSelector(
                          selectedMood: _selectedMood,
                          onMoodSelected: (mood) {
                            setState(() {
                              _selectedMood = mood;
                            });
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Action Buttons
                      Row(
                        children: [
                          ActionButton(
                            text: 'Add Photo',
                            icon: Icons.image_outlined,
                            backgroundColor: const Color(0xFFE8D5FF),
                            textColor: const Color(0xFF8B5CF6),
                            onTap: () {
                              // TODO: Implement photo selection
                            },
                          ),
                          const SizedBox(width: 12),
                          ActionButton(
                            text: 'Add Tags',
                            icon: Icons.tag_outlined,
                            backgroundColor: const Color(0xFFFFD6E8),
                            textColor: const Color(0xFFEC4899),
                            onTap: () {
                              // TODO: Implement tag selection
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),

              // Bottom Quote
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Breathe. You\'re safe here. ',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      TextSpan(text: '🌿', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
