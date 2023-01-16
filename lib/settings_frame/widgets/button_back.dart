import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        InkWell(
          child: SizedBox(
            width: screenWidth * 0.02,
            height: screenHeight * 0.013,
            child: const Icon(
              Icons.chevron_left,
              color: Color(0xFFFFFFFF),
            ),
          ),
        )
      ],
    );
  }
}
