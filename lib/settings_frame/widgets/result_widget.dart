import 'package:flutter/material.dart';

import 'button_back.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.11,
          ),
          const ButtonBack(),
        ],
      ),
    );
  }
}
