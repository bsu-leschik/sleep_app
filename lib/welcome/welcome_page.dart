import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'welcome_text.dart';

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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/first_load/1.png"),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                PageView(
                  controller: _pageController,
                  children: const [
                    WelcomeText(
                      title:
                          "Welcome to the\njorney\nto healthy spleep,\nconcentration\nand general peace",
                    ),
                    WelcomeText(
                      title:
                          "Pick up the right\nsounds from our\ndatabase and save\ntheme to presets",
                    ),
                    WelcomeText(
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
                  child: ContinueButton(pageController: _pageController),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (_pageController.page == 2) {
            context.go('/subscribe');
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
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 69, vertical: 15),
                decoration: BoxDecoration(
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                        colors: [Color(0xFF202432), Color(0xFF4c566c)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter),
                  ),
                  borderRadius: BorderRadius.circular(43),
                ),
                child: const Text(
                  "Continue",
                  style: (TextStyle(
                    fontFamily: 'Poetsen',
                    color: Color(0xFFFFFFFF),
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  )),
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
        );
  }
}
