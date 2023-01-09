import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sleep_app/premium/sub_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_widget.dart';
import 'package:blur/blur.dart';

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
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
          ),
          // При экспорте получается полная шляпка (изображение не расстягивается на экран)
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
            bottom: 290,
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
            bottom: 112,
            right: 54,
            left: 54,
            child: InkWell(
                onTap: () {
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
                child: Stack(children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xff8E9FCC).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(43.0),
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xff8E9FCC).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(43.0),
                          border: Border.all(
                            color: const Color(0xFF4C566C),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Continue",
                            style: (TextStyle(
                              fontFamily: 'Poetsen',
                              color: Color(0xFFFFFFFF),
                              fontSize: 32,
                              height: 38.4 / 32,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])
                // .blurred(
                //     blurColor: const Color.fromRGBO(32, 36, 50, 0),
                //     colorOpacity: 0.05,
                //     borderRadius: BorderRadius.circular(43.0),
                //     blur: 0.15),
                ),
          ),
        ],
      ),
    );
  }
}
