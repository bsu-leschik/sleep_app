import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomPremium extends StatelessWidget {
  const BottomPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomTerms(title: "Restore Purchases"),
        BottomTerms(title: "Terms of Use"),
        BottomTerms(title: "Privacy Policy"),
      ],
    );
  }
}

class BottomTerms extends StatelessWidget {
  final String title;
  const BottomTerms({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Text(
          title,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
