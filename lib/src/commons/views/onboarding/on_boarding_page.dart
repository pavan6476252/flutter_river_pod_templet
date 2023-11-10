import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod_base/src/commons/views/onboarding/widgets/page1.dart';
import 'package:flutter_riverpod_base/src/commons/views/onboarding/widgets/page2.dart';
import 'package:flutter_riverpod_base/src/commons/views/onboarding/widgets/page3.dart';
import 'package:flutter_riverpod_base/src/res/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  static const routePath = "/onboarding";
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch(
                  accentColor: Color.fromARGB(0, 255, 255, 255),
                ),
              ),
              child: PageView(
                controller: pageController,
                children: const [
                  Page1(),
                  Page2(),
                  Page3(),
                ],
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            onDotClicked: (index) => pageController.animateToPage(index,
                duration: const Duration(seconds: 1), curve: Curves.easeIn),
            effect: WormEffect(
                spacing: 28,
                activeDotColor: ColorAssets.primaryBlue,
                dotColor: ColorAssets.lightGray,
                dotWidth: 12,
                dotHeight: 12),
          ),
          const SizedBox(
            height: 84,
          )
        ],
      ),
    );
  }
}
