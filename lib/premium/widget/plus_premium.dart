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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 61,
        ),
        Image.asset(image),
        const SizedBox(
          width: 14.65,
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
