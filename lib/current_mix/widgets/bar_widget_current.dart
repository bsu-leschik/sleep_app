import 'package:flutter/material.dart';

import '../../fiveth_frame/widget/bottom_bar.dart';

class BarWidgetCurrent extends StatelessWidget {
  const BarWidgetCurrent({super.key});

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
              "Current mix",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'Poetsen',
                fontWeight: FontWeight.w400,
                fontSize: 23,
                height: 27.6 / 23,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight,
            right: screenWidth,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const BottomBar(),
                ),
              );
            },
            child: const Icon(
              Icons.close,
              color: Color(0xFFFFFFFF),
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
