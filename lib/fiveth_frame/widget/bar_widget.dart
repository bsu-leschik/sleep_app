import 'package:flutter/material.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final box = SizedBox(
    //   width: MediaQuery.of(context).size.width * 0.04,
    // );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        const Text(
          "Melodies for sleep",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'PoetsenOne',
            fontWeight: FontWeight.w400,
            fontSize: 23,
            height: 23.6 / 23,
          ),
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFF003293),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
      ],
    );
  }
}
