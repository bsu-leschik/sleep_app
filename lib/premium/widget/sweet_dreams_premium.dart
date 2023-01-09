import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SweetDreamsPremium extends StatelessWidget {
  const SweetDreamsPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
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
        const SizedBox(
          height: 8,
        ),
        Text(
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
        const SizedBox(
          height: 44,
        ),
      ],
    );
  }
}
