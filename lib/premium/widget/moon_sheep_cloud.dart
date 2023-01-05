import 'package:flutter/material.dart';

class MoonSheepCloud extends StatelessWidget {
  const MoonSheepCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        Positioned(
          top: 70,
          right: 58,
          width: 130,
          height: 87,
          child: Image.asset(
              "assets/images/premium/Sheep3x.png"), // "assets/images/shopping/Sheep.png"
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 126,
          top: 82,
          // height: 126,
          // width: 126,
          child: Image.asset(
            "assets/images/premium/Moon3x.png",
            height: 238,
            width: 238,
          ),

          // "assets/images/shopping/Moon.png"
        ),
        Positioned(
          top: 103,
          left: -30, width: 125,
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
          left: 91, width: 197,
          height: 63,
          child: Image.asset(
              "assets/images/premium/BCC3x.png"), // "assets/images/shopping/Lefttopcloud.png"
        ),
      ]),
    );
  }
}
