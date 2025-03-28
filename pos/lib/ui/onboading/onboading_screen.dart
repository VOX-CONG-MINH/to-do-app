import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../pos.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": Assets.images.onboading1.path,
      "title": "Manage your tasks",
      "description":
          "You can easily manage all of your daily tasks in DoMe for free",
    },
    {
      "image": Assets.images.onboading2.path,
      "title": "Create daily routine",
      "description":
          "In Uptodo you can create your personalized routine to stay productive",
    },
    {
      "image": Assets.images.onboading2.path,
      "title": "Organize your tasks",
      "description":
          "You can organize your daily tasks by adding your tasks into separate categories",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return _onboardingPage(
                        image: onboardingData[index]["image"]!,
                        title: onboardingData[index]["title"]!,
                        description: onboardingData[index]["description"]!,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _currentPage > 0
                        ? TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => const StartScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "SKIP",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.monaSans,
                            ),
                          ),
                        )
                        : const SizedBox(),
                    ElevatedButton(
                      onPressed: () {
                        if (_currentPage == onboardingData.length - 1) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const StartScreen(),
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        backgroundColor: const Color(0xFFff7361),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        _currentPage == onboardingData.length - 1
                            ? "GET STARTED"
                            : "NEXT",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.monaSans,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (_currentPage > 0)
            Positioned(
              left: 20,
              top: MediaQuery.of(context).size.height * 0.45,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: AppColor.whileGrey),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _onboardingPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Image.asset(image, height: 250),
          const SizedBox(height: 24),
          SmoothPageIndicator(
            controller: _pageController,
            count: onboardingData.length,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Colors.purpleAccent,
              dotColor: Colors.grey.shade600,
              expansionFactor: 4,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: FontFamily.monaSans,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontFamily: FontFamily.monaSans,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
