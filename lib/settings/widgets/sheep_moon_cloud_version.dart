import 'package:flutter/material.dart';

class MoonSheepCloudVersion extends StatelessWidget {
  const MoonSheepCloudVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.424,
      child: Stack(
        children: [
          Positioned(
            bottom: screenHeight * 0.26,
            left: screenWidth * 0.67,
            child: Image.asset(
              "assets/images/settings/CL1.png",
              width: screenWidth * 0.33,
              height: screenHeight * 0.1,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.14,
            left: -(screenWidth * 0.12),
            child: Image.asset(
              "assets/images/settings/CL2.png",
              width: screenWidth * 0.48,
              height: screenHeight * 0.14,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.16,
            left: screenWidth * 0.35,
            child: Image.asset(
              "assets/images/settings/CL3.png",
              width: screenWidth * 0.27,
              height: screenHeight * 0.08,
            ),
          ),
          Positioned(
            bottom: -(screenHeight * 0.055),
            right: screenWidth * 0.01,
            child: Image.asset(
              "assets/images/settings/Moon.png",
              width: screenWidth * 0.63,
              height: screenHeight * 0.63,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.065,
            right: -(screenWidth * 0.09),
            child: Image.asset(
              "assets/images/settings/SH1.png",
              width: screenWidth * 0.35,
              height: screenHeight * 0.14,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.035,
            right: screenWidth * 0.105,
            child: Image.asset(
              "assets/images/settings/V1.png",
              width: screenWidth * 0.15,
              height: screenHeight * 0.14,
            ),
          ),
          Positioned(
            bottom: 0,
            left: screenWidth * 0.12,
            child: Image.asset(
              "assets/images/settings/SH2.png",
              width: screenWidth * 0.34,
              height: screenHeight * 0.13,
            ),
          ),
        ],
      ),
    );
  }
}
