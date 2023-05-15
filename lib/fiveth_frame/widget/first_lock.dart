import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleep_app/fiveth_frame/widget/types_list.dart';
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
  final List<MuzModOne> firstList = [
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
      child: TypesList(firstList),
    );
  }
}
