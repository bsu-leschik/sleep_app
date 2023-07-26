import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleep_app/player/timer_picker/widgets/pickers.dart';

import 'buttons.dart';

class SleepTimePicker extends StatelessWidget {
  SleepTimePicker({
    super.key,
  });

  final TextStyle generalTextStyle = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 16,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 77),
          child: Container(
            margin: const EdgeInsets.only(top: 39),
            child: DecoratedTimePicker(generalTextStyle: generalTextStyle),
          ),
        ),
        const TimerButtons(),
      ],
    );
  }
}
