import 'package:flutter/material.dart';
import '../../Data/Models/onboarding_models.dart';
import '../Widgets/onboarding_body.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingModel> _pages = OnboardingModel.onboardingList;

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          onPageChanged: (index) => setState(() => _currentPage = index),
          itemBuilder: (context, index) => OnboardingBody(
            model: _pages[index],
            pageIndex: index,
            currentPage: _currentPage,
            totalPages: _pages.length,
            onPressed: _nextPage,
          ),
        ),
      ),
    );
  }
}