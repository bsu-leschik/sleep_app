import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavButton extends StatelessWidget {
  final Text label;
  final Widget icon;
  final Function onTap;

  BottomNavButton(
      {required String labelText,
      required this.icon,
      required this.onTap,
      super.key})
      : label = Text(labelText,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ));

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        margin: const EdgeInsets.only(top: 8),
        width: 88,
        padding: const EdgeInsets.only(left: 11, right: 12),
        child: GestureDetector(
            onTap: () => onTap.call(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [icon, label])));
  }
}
