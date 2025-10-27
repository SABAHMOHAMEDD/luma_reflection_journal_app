import 'package:flutter/material.dart';
import 'package:reflex_app/core/config/theme/app_colors.dart';
import 'package:reflex_app/features/theme/data/theme_data.dart';
import 'package:reflex_app/features/theme/presentation/widgets/theme_card.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  late List<ThemeOption> themes;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    themes = ThemeDataSource.themes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFE8D5FF), const Color(0xFFFFD6E8)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF2D2D2D),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose Your Atmosphere',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D2D2D),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Select the background that matches your mood',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B6B6B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Theme Grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: themes.length,
                  itemBuilder: (context, index) {
                    final theme = themes[index];
                    return ThemeCard(
                      name: theme.name,
                      gradientStart: theme.gradientStart,
                      gradientEnd: theme.gradientEnd,
                      isSelected: index == selectedIndex,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      }, image: theme.image,
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Apply Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.buttonBackground,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Apply Theme',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.buttonText,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
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
