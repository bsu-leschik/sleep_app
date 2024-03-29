import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        InkWell(
          onTap: (() {
            Navigator.pushNamed(context, "/fiveframe");
          }),
          child: const Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFFFFFFFF),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.02,
        ),
        const Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "Settings",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: "Poetsen",
                fontWeight: FontWeight.w400,
                fontSize: 23,
                height: 27.6 / 23,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
