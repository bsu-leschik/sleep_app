import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlusPremium extends StatelessWidget {
  final String title;
  final String image;
  const PlusPremium({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * 0.16,
        ),
        Image.asset(image),
        SizedBox(
          width: screenWidth * 0.04,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Color(0xFFCACACA),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 24.55 / 18,
            ),
          ),
        )
      ],
    );
  }
}
