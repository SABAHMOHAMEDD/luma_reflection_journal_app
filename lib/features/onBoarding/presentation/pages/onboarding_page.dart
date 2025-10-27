import 'package:flutter/material.dart';
import 'package:reflex_app/core/utils/system_utils.dart';
import 'package:reflex_app/features/home/presentation/pages/home_page.dart';
import 'package:reflex_app/features/onBoarding/data/onboarding_data.dart';
import 'package:reflex_app/features/onBoarding/presentation/widgets/onboarding_slide.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingData> _slides = OnboardingDataSource.slides;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onButtonPressed() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
     
      debugPrint('Onboarding completed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemUtils.hideStatusBarAndNavigationBarForAndroid();
    return Scaffold(
      body: Column(
        children: [
          // PageView with slides
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                return OnboardingSlide(
                  data: _slides[index],
                  onButtonPressed: _onButtonPressed,
                  currentPage: index,
                  slides: _slides,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
