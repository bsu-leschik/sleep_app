import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlusPremium extends StatelessWidget {
  const PlusPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PlusPremiumConstructor(
          image: "assets/images/shopping/Corona.png",
          title: "Full acces to the sleep library",
        ),
        PlusPremiumConstructor(
          image: "assets/images/shopping/Music.png",
          title: "Relaxing music",
        ),
        PlusPremiumConstructor(
          image: "assets/images/shopping/Flower.png",
          title: "Sleep medidations",
        ),
      ],
    );
  }
}

class PlusPremiumConstructor extends StatelessWidget {
  final String title;
  final String image;
  const PlusPremiumConstructor({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(image),
        const SizedBox(width: 14),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Color(0xFFCACACA),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
