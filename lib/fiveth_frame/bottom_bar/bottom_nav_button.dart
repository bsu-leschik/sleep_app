import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavButton extends StatelessWidget {
  final Text label;
  final Widget icon;
  final Function onTap;

  BottomNavButton(
      {required String labelText,
      required IconData icon,
      required this.onTap,
      super.key})
      : label = Text(labelText,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            )),
        icon = Icon(
          icon,
          color: Colors.white,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        margin: const EdgeInsets.only(top: 8),
        width: 88,
        child: GestureDetector(
            onTap: () => onTap.call(), child: Column(children: [icon, label])));
  }
}
