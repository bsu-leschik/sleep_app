import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoonSheepCloud extends StatelessWidget {
  const MoonSheepCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        Image.asset(
          "assets/images/premium/Stars3x.png",
          width: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        Positioned(
          child: Image.asset(
              "assets/images/premium/Sheep3x.png"), // "assets/images/shopping/Sheep.png"
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 126,
          top: 82,
          child: Image.asset(
              "assets/images/premium/Moon3x.png"), // "assets/images/shopping/Moon.png"
          // color: Colors.red,
        ),
        Positioned(
          top: 197,
          left: 65,
          child: Image.asset(
              "assets/images/premium/TLC3x.png"), // "assets/images/shopping/Leftbottomcloud.png"
        ),
        Positioned(
          top: 105,
          right: 0,
          child: Image.asset(
              "assets/images/premium/BLC3x.png"), // "assets/images/shopping/Rightbottomcloud.png"
        ),
        Positioned(
          top: 103,
          left: 0,
          child: Image.asset(
              "assets/images/premium/BCC3x.png"), // "assets/images/shopping/Lefttopcloud.png"
        ),
      ]),
    );
  }
}
