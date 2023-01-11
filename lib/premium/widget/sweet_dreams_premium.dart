import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SweetDreamsPremium extends StatelessWidget {
  const SweetDreamsPremium({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight * 0.05,
          width: screenWidth * 0.75,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "Sweet dreams",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 33,
                  fontWeight: FontWeight.w400,
                  height: 45 / 33,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        SizedBox(
          height: screenHeight * 0.05,
          width: screenWidth * 0.40,
          child: Text(
            "PREMIUM",
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 33,
                fontWeight: FontWeight.w700,
                height: 45 / 33,
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.05,
        ),
      ],
    );
  }
}
