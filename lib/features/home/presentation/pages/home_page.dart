import 'package:flutter/material.dart';
import 'package:reflex_app/core/config/theme/app_colors.dart';
import 'package:reflex_app/core/utils/app_decoration.dart';
import 'package:reflex_app/core/utils/system_utils.dart';
import 'package:reflex_app/core/widgets/icons/floating_icon.dart';
import 'package:reflex_app/features/home/data/home_data.dart';
import 'package:reflex_app/features/home/presentation/pages/add_thought_page.dart';
import 'package:reflex_app/features/home/presentation/widgets/reflection_card.dart';
import 'package:reflex_app/features/stats/presentation/pages/stats_page.dart';
import 'package:reflex_app/features/theme/presentation/pages/theme_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final reflections = HomeDataSource.reflections;
    SystemUtils.hideStatusBarAndNavigationBarForAndroid();

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Reflex',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.auto_awesome,
                            size: 20,
                            color: AppColors.lumaPurple.withOpacity(0.8),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.face_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StatsPage(),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ThemePage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Mascot and Quote
                Column(
                  children: [
                    FloatingIcon(
                      iconAsset: 'assets/images/luma_happy.png',
                      size: 100,
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      '"Breathe. You\'re safe here." 💙',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Reflections List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: reflections.length,
                    itemBuilder: (context, index) {
                      final reflection = reflections[index];
                      return ReflectionCard(
                        date: reflection.date,
                        title: reflection.title,
                        emoji: reflection.emoji,
                        preview: reflection.preview,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddThoughtPage(entryToEdit: reflection),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddThoughtPage()),
          );
        },
        child: Container(
          width: 56,
          height: 56,
          decoration: AppDecorations.gradientButtonDecoration,
          child: Center(child: Icon(Icons.add, color: Colors.white)),
        ),
      ),
    );
  }
}
