import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsInfo extends StatelessWidget {
  const SettingsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const ConstructorInfo(
          icons: Icons.info,
          title: "Terms of Use",
          ontap: "",
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        const ConstructorInfo(
          icons: Icons.lock,
          title: "Privacy Policy",
          ontap: "",
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        const ConstructorInfo(
          icons: Icons.info,
          title: "Support",
          ontap: "",
        ),
      ],
    );
  }
}

class ConstructorInfo extends StatelessWidget {
  final String title;
  final dynamic icons;
  final String ontap;
  const ConstructorInfo(
      {super.key,
      required this.icons,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.11,
        ),
        Icon(
          icons,
          color: const Color(0xFF8E9FCC),
        ),
        SizedBox(
          width: screenWidth * 0.03,
        ),
        InkWell(
          onTap: () {
            ontap;
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              title,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontSize: 16,
                  height: 21.82 / 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8E9FCC),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// class IconText {
//   final icon;
//   final String title;
//   IconText({
//     required this.icon,
//     required this.title,
//   });
// }
