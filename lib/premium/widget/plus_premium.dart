import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlusPremium extends StatelessWidget {
  const PlusPremium({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const PlusPremiumConstructor(
          image: "assets/images/shopping/Corona.png",
          title: "Full acces to the sleep library",
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        const PlusPremiumConstructor(
          image: "assets/images/shopping/Music.png",
          title: "Relaxing music",
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        const PlusPremiumConstructor(
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
