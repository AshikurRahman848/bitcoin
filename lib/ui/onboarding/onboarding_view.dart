import 'package:bitcoin/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding_slide.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  late Timer _timer;

  void _onPageChanged(int page) {
    setState(() {
      currentIndex = page;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentIndex < 2) {
        currentIndex++;
        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          OnboardingSlide(
            title: 'Are you new to Bitcoin?',
            description:
                'Lorem ipsum dolor sit amet consectetur. Nibh mollis leo nunc egestas id metus facilisi pulvinar. Ultricies morbi ut tellus faucibus lacus sit varius mi turpis sit in.',
            imagePath: 'assets/images/onboarding1.png',
            currentIndex: currentIndex,
            pageIndex: 0,
          ),
          OnboardingSlide(
            title: 'Explore Bitcoin with Us',
            description:
                'Our products are open source & they have been independently audited by thousands of experts around the world.',
            imagePath: 'assets/images/onboarding2.png',
            currentIndex: currentIndex,
            pageIndex: 1,
          ),
          OnboardingSlide(
            title: 'Join the Bitcoin Community',
            description:
                'Be a part of the future of finance with Bitcoin. Secure, reliable, and innovative.',
            imagePath: 'assets/images/onboarding3.png',
            currentIndex: currentIndex,
            pageIndex: 2,
          ),
        ],
      ),
    );
  }
}
