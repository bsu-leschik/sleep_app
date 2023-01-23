import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentAlertDialog extends StatelessWidget {
  const CurrentAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        color: Colors.red,
        height: 23,
        width: 279,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Rain",
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  height: 22 / 16,
                ),
              ),
            ),
            CloseButton(
              color: const Color(0xFFFFFFFF),
              onPressed: () {
                print("Press close Button");
              },
            ),
          ],
        ),
      ),
      content: Text(
        "https://Lorem ipsum dolor sit amet, consectetur adipiscing"
        "elit. Hendrerit et dignissim donec donec neque donec tempor.",
        style: GoogleFonts.nunito(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 22 / 16,
          ),
        ),
      ),
    );
  }
}
