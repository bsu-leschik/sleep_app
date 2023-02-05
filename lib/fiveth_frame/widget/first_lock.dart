import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/data.dart';

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
    MuzModOne(
      image: "assets/images/music/Winter.png",
      title: "Winter",
    ),
  ];
  List<MuzModOne> twoList = [
    MuzModOne(
      image: "assets/images/music/Mediative.png",
      title: "Mediative space",
    ),
    MuzModOne(
      image: "assets/images/music/Moonmusic.png",
      title: "Moon vibes",
    ),
    MuzModOne(
      image: "assets/images/music/Winter.png",
      title: "Winter",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List ddd = [
      firstList,
      twoList,
      [],
      [],
      [],
      [],
      [],
      [],
      [],
      [],
    ];

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    List<MuzModOne> activeList = ddd[context
        .read<DataTypeMusic>()
        .type
        .values
        .map((e) => e)
        .toList()
        .indexOf(true)];
    // print(context
    //     .read<DataTypeMusic>()
    //     .type
    //     .values
    //     .map((e) => e)
    //     .toList()
    //     .indexOf(true));

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.transparent,
      height: screenHeight * 0.296,
      width: screenWidth,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          dragStartBehavior: DragStartBehavior.start,
          shrinkWrap: false,
          itemCount: activeList.length,
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
                height: screenHeight * 0.12,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.09,
                          child: Image.asset(activeList[index].image),
                        ),
                        SizedBox(
                          width: screenWidth * 0.2,
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                activeList[index].title,
                                overflow: TextOverflow.ellipsis,
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
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
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
