import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  const OnboardingWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 33,
              fontWeight: FontWeight.w400,
              height: 45 / 33,
            ),
          ),
          // style: GoogleFonts.nunito(TextStyle(
          //   color: Colors.white,
          //   fontSize: 33,
          //   fontWeight: FontWeight.w400,
          //   height: 45 / 33,
          // )),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
      ],
    );
  }
}
