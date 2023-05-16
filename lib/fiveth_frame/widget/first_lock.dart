import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/widget/music_element.dart';
import 'package:sleep_app/fiveth_frame/widget/types_list.dart';

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
  final List<MusicElement> firstList = [
    const MusicElement(
      image: Image(image: AssetImage("assets/images/music/Mediative.png")),
      title: "Mediative space",
      property: SoundProperties.locked,
    ),
    const MusicElement(
      image: Image(image: AssetImage("assets/images/music/Moonmusic.png")),
      title: "Moon vibes",
      property: SoundProperties.locked,
    ),
    const MusicElement(
      image: Image(image: AssetImage("assets/images/music/Peaceful.png")),
      title: "Peaceful and calm",
      property: SoundProperties.locked,
    ),
    const MusicElement(
      image: Image(image: AssetImage("assets/images/music/Tropical.png")),
      title: "Tropical",
      property: SoundProperties.locked,
    ),
    const MusicElement(
      image: Image(image: AssetImage("assets/images/music/Winter.png")),
      title: "Winter",
      property: SoundProperties.locked,
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
