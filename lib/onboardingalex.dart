import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sleep_app/subscription_widget/sub_widget.dart';
import 'package:sleep_app/welcome_widget/animation.dart/animation_on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        child: Expanded(
          child: Stack(
            children: [
              const Rotation(
                title: '',
              ),
              PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(
                    () {
                      print(value);
                    },
                  );
                },
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Welcome to the\njorney\nto healthy spleep,\nconcentration\nand generalpeace",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Pick up the right\nsounds from our\ndatabase and save\ntheme to presets",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Dive into a peasful\ndeeper sleep",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 550,
                right: 170,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.amber,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 10.0,
                  ),
                ),
              ),
              Positioned(
                top: 662,
                right: 70,
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
                  minSize: 74.0,
                  color: const Color.fromARGB(255, 4, 95, 227),
                  borderRadius: BorderRadius.circular(45.0),
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
      ),
    );
  }
}
