import 'package:flutter/material.dart';

import '../../settings_frame/settings_widget.dart';
import '../../settings_frame/widgets/result_widget.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.04;
    final double screenHeight = MediaQuery.of(context).size.height * 0.09;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: screenWidth,
            top: screenHeight,
          ),
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "Melodies for sleep",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'Poetsen',
                fontWeight: FontWeight.w400,
                fontSize: 23,
                height: 23.6 / 23,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight,
            right: screenWidth,
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF003293),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultWidget(),
                  ),
                );
              },
              child: const Icon(
                Icons.settings,
                color: Color(0xFFFFFFFF),
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
