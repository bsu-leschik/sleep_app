import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sleep_app/subscription_widget/sub_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  print(value);
                });
              },
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SvgPicture.asset('assets/obPic1.svg'),
                      // child: Container(
                      //   // color: Colors.amber,
                      //   // padding: const EdgeInsets.symmetric(horizontal: 45),
                      //   child: SvgPicture.asset('assets/obPic1.svg'),
                      // ),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    AnimationAppTour(
                      4,
                      Column(
                        children: const [
                          Text("Get a Loan Quickly Anytime",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Get a loan for urgent purchases,\nbusiness development or your dreams",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff404040),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height < 800 ? 194 : 234,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SvgPicture.asset('assets/obPic2.svg'),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    AnimationAppTour(
                      4,
                      Column(
                        children: const [
                          Text("No Extra Comissions",
                              style: TextStyle(
                                fontFamily: 'SFProDisplay',
                                color: Color(0xff000000),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Honest direct lenders and\nunderstandable agreements",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff404040),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height < 800 ? 194 : 234,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SvgPicture.asset('assets/obPic3.svg'),
                    ),
                    const SizedBox(
                      height: 52,
                    ),
                    AnimationAppTour(
                      4,
                      Column(children: const [
                        Text("Fast Approval Process",
                            style: TextStyle(
                              fontFamily: 'SFProDisplay',
                              color: Color(0xff000000),
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Get money on your account no later\nthan 24 hours after approval",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff404040),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height < 800 ? 194 : 234,
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 38.0,
              right: 38.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: JumpingDotEffect(
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        spacing: 10.0,
                        dotColor: const Color(0xff2c5fe3).withOpacity(0.3),
                        activeDotColor: const Color.fromARGB(255, 44, 95, 227),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CupertinoButton(
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
                    color: const Color.fromARGB(255, 44, 95, 227),
                    borderRadius: BorderRadius.circular(18.0),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height < 800 ? 40 : 80,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimationAppTour(int i, Column column) {}
}
