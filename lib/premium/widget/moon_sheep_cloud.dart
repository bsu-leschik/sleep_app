import 'package:flutter/material.dart';

class MoonSheepCloud extends StatelessWidget {
  const MoonSheepCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        Positioned(
          top: 110,
          right: 58,
          child: Image.asset(
            "assets/images/premium/Sheep3x.png",
            width: 130,
            height: 90,
          ), // "assets/images/shopping/Sheep.png"
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 126,
          top: 82,
          child: Image.asset(
            "assets/images/premium/Moon3x.png",
            height: 238,
            width: 238,
          ),

          // "assets/images/shopping/Moon.png"
        ),
        Positioned(
          top: 103,
          left: -30,
          child: Image.asset(
            "assets/images/premium/TLC3x.png",
            width: 125,
            height: 83,
          ), // "assets/images/shopping/Leftbottomcloud.png"
        ),
        Positioned(
          top: 165,
          right: -30,
          child: Image.asset(
            "assets/images/premium/BLC3x.png",
            width: 138,
            height: 92,
          ), // "assets/images/shopping/Rightbottomcloud.png"
        ),
        Positioned(
          top: 197,
          right: 180,
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
