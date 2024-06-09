import 'package:bitcoin/ui/onboarding/onboarding_slide.dart';
import 'package:flutter/material.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  void _onPageChanged(int page) {
    setState(() {
      currentIndex = page;
    });
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
            title: 'Lorem ipsum dolor sit amet consectetur. Et.',
            description:
                'Our products are open source & they have been independently audited by thousands of experts around the world.',
            imagePath: 'assets/images/onboarding2.png',
            currentIndex: currentIndex,
            pageIndex: 1,
            
          ),
          OnboardingSlide(
            title: 'Lorem ipsum dolor sit amet consectetur. Et.',
            description:
                'Our products are open source & they have been independently audited by thousands of experts around the world.',
            imagePath: 'assets/images/onboarding3.png',
            currentIndex: currentIndex,
            pageIndex: 2,
            
          ),
        ],
      ),
    );
  }
}

