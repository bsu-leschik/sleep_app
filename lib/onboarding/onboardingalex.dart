import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sleep_app/premium/sub_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_widget.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({super.key});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141733),
      body: SafeArea(
        child: Stack(
          children: [
            // const Rotation(
            // title: '',
            // ),

            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(
                  () {
                    print(value);
                  },
                );
              },
              children: const [
                OnboardingWidget(
                  title:
                      "Welcome to the\njorney\nto healthy spleep,\nconcentration\nand general peace",
                ),
                OnboardingWidget(
                  title:
                      "Pick up the right\nsounds from our\ndatabase and save\ntheme to presets",
                ),
                OnboardingWidget(
                  title: "Dive into a peasful\ndeeper sleep",
                ),
              ],
            ),
            Positioned(
              bottom: 218,
              right: 170,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const WormEffect(
                  dotColor: Color(0xFFCACACA),
                  activeDotColor: Color(0xFFFA9044),
                  dotHeight: 10.0,
                  dotWidth: 10.0,
                  spacing: 10.0,
                ),
              ),
            ),
            Positioned(
              bottom: 42,
              right: 54,
              left: 54,
              child: CupertinoButton(
                onPressed: () {
                  if (_pageController.page == 1) {}

                  if (_pageController.page == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubscribeWidget()),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 400,
                      ),
                      curve: Curves.ease,
                    );
                  }
                },
                minSize: 70.0,
                color: const Color(0xff202432),
                borderRadius: BorderRadius.circular(43.0),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Color(0xffffffff),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
