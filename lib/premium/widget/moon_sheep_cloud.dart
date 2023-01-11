import 'package:flutter/material.dart';

class MoonSheepCloud extends StatelessWidget {
  const MoonSheepCloud({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Stack(children: [
        Positioned(
          top: screenHeight * 22 / 844,
          right: screenWidth * 58 / 390,
          child: Image.asset(
            "assets/images/premium/Sheep3x.png",
            width: screenWidth * 0.33,
            height: screenHeight * 0.11,
          ), // "assets/images/shopping/Sheep.png"
        ),
        Positioned(
          left: screenWidth / 2 - 126,
          top: -(screenHeight * 0.04),
          child: Image.asset(
            "assets/images/premium/Moon3x.png",
            height: screenHeight * 0.28,
            width: screenWidth * 0.61,
          ),
          // "assets/images/shopping/Moon.png"
        ),
        Positioned(
          top: screenHeight * 0.017,
          left: -(screenWidth * 0.04),
          child: Image.asset(
            "assets/images/premium/TLC3x.png",
            width: screenWidth * 0.32,
            height: screenHeight * 0.1,
          ), // "assets/images/shopping/Leftbottomcloud.png"
        ),
        Positioned(
          top: screenHeight * 0.097,
          right: -(screenWidth * 0.08),
          child: Image.asset(
            "assets/images/premium/BLC3x.png",
            width: 138,
            height: 92,
          ), // "assets/images/shopping/Rightbottomcloud.png"
        ),
        Positioned(
          top: screenHeight * 0.13,
          left: screenWidth * 0.10,
          child: Image.asset(
            "assets/images/premium/BCC3x.png",
            width: 197,
            height: 63,
          ), // "assets/images/shopping/Lefttopcloud.png"
        ),
      ]),
    );
  }
}

class Insets {
  static const double sm = 10;
  static const double med = 15;
  static const double high = 20;
}
