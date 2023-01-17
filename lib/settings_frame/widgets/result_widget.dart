import 'package:flutter/material.dart';

import 'button_back.dart';
import 'settings_info.dart';
import 'sheep_moon_cloud_version.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.03,
            child: const ButtonBack(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.18,
              ),
              const SettingsInfo(),
              SizedBox(
                height: screenHeight * 0.16,
                width: screenWidth,
              ),
              const MoonSheepCloudVersion(),
            ],
          ),
        ],
      ),
    );
  }
}
