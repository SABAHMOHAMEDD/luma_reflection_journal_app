class OnboardingData {
  final String backgroundAsset;
  final String mascotAsset;
  final String title;
  final String description;
  final String buttonText;

  const OnboardingData({
    required this.backgroundAsset,
    required this.mascotAsset,
    required this.title,
    required this.description,
    required this.buttonText,
  });
}

class OnboardingDataSource {
  static List<OnboardingData> get slides => [
        OnboardingData(
          backgroundAsset: 'assets/images/onboarding1.png',
          mascotAsset: 'assets/images/luma_sleeping.png',
          title: 'Discover Patterns',
          description: 'Track your mood and see how you grow over time.',
          buttonText: 'Get Started',
        ),
        OnboardingData(
          backgroundAsset: 'assets/images/onboarding2.png',
          mascotAsset: 'assets/images/luma_happy.png',
          title: 'Capture Your Emotions',
          description: 'Write freely and discover what\'s in your heart.',
          buttonText: 'Next',
        ),
        OnboardingData(
          backgroundAsset: 'assets/images/onboarding3.png',
          mascotAsset: 'assets/images/luma_happy.png',
          title: 'Welcome to Reflex 🌿',
          description: 'Your safe space to reflect, write, and grow.',
          buttonText: 'Next',
        ),
      ];
}

