import 'package:flutter/material.dart';

class FirstLock extends StatefulWidget {
  const FirstLock({super.key});

  @override
  State<FirstLock> createState() => _FirstLockState();
}

class _FirstLockState extends State<FirstLock> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.296,
      width: screenWidth,
      color: Colors.amber,
      child: const Center(
        child: Text("data"),
      ),
    );
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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
