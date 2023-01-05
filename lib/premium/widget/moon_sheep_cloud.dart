import 'package:flutter/material.dart';

class MoonSheepCloud extends StatelessWidget {
  const MoonSheepCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        Positioned(
          top: 70, right: 58,
          width: 130, height: 87,
          child: Image.asset(
              "assets/images/premium/Sheep3x.png"), // "assets/images/shopping/Sheep.png"
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 126,
          top: 82, height: 78,
          width: 78,
          child: Image.asset(
              "assets/images/premium/Moon3x.png"), // "assets/images/shopping/Moon.png"
          // color: Colors.red,
        ),
        Positioned(
          top: 197,
          left: 65, width: 125,
          height: 83,
          child: Image.asset(
              "assets/images/premium/TLC3x.png"), // "assets/images/shopping/Leftbottomcloud.png"
        ),
        Positioned(
          top: 105,
          right: 0, width: 138,
          height: 92,
          child: Image.asset(
              "assets/images/premium/BLC3x.png"), // "assets/images/shopping/Rightbottomcloud.png"
        ),
        Positioned(
          top: 103,
          left: 0, width: 94,
          height: 63,
          child: Image.asset(
              "assets/images/premium/BCC3x.png"), // "assets/images/shopping/Lefttopcloud.png"
        ),
      ]),
    );
  }
}
