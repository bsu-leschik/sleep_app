import 'package:flutter/material.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width * 0.04;
    // final double screenHeight = MediaQuery.of(context).size.height * 0.09;
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Padding(
          //   padding: EdgeInsets.only(
          //     left: screenWidth,
          //     top: screenHeight,
          // ),
          const FittedBox(
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
          // );
          // Padding(
          //   padding: EdgeInsets.only(
          //     top: screenHeight,
          //     right: screenWidth,
          //   ),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF003293),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/settings");
                // Navigator.of(context).push(
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) => const SettingsWidget(),
                //   ),
                // );
              },
              child: const Icon(
                Icons.settings,
                color: Color(0xFFFFFFFF),
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
