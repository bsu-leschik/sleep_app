import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';

class FirstLock extends StatefulWidget {
  const FirstLock({super.key});

  @override
  State<FirstLock> createState() => _FirstLockState();
}

class _FirstLockState extends State<FirstLock> {
  @override
  Widget build(BuildContext context) {
    return const GridFirst();
  }
}

class MuzModOne {
  final String image;
  final String title;
  MuzModOne({
    required this.image,
    required this.title,
  });
}

class GridFirst extends StatefulWidget {
  const GridFirst({super.key});

  @override
  State<GridFirst> createState() => _GridFirstState();
}

class _GridFirstState extends State<GridFirst> {
  List<MuzModOne> firstList = [
    MuzModOne(
      image: "assets/images/music/Mediative.png",
      title: "Mediative space",
    ),
    MuzModOne(
      image: "assets/images/music/Moonmusic.png",
      title: "Moon vibes",
    ),
    MuzModOne(
      image: "assets/images/music/Peaceful.png",
      title: "Peaceful and calm",
    ),
    MuzModOne(
      image: "assets/images/music/Tropical.png",
      title: "Tropical",
    ),
    MuzModOne(
      image: "assets/images/music/Winter.png",
      title: "Winter",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.fromLTRB(26, 20, 26, 40),
      color: Colors.transparent,
      height: 284,
      width: screenWidth,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          dragStartBehavior: DragStartBehavior.start,
          shrinkWrap: false,
          itemCount: firstList.length,
          primary: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Container(
                // padding: EdgeInsets.only(left: screenWidth * 0.06),
                color: Colors.transparent,
                alignment: Alignment.center,
                width: screenWidth * 0.287,
                height: 102,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.09,
                          child: Image.asset(firstList[index].image),
                        ),
                        SizedBox(
                          width: 112,
                          child: Center(
                            child: TextScroll(
                              delayBefore: const Duration(seconds: 1),
                              pauseBetween: const Duration(seconds: 3),
                              fadedBorder: true,
                              velocity: const Velocity(
                                  pixelsPerSecond: Offset(30, 0)),
                              firstList[index].title,
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 17.37 / 12,
                                  color: Color(0xFF8E9FCC),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 14,
                      child: SizedBox(
                        width: screenWidth * 0.07,
                        height: screenHeight * 0.03,
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF003293),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Icon(
                              Icons.lock,
                              size: 15,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
