import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/timer_picker/provider/timer_provider.dart';
import 'package:sleep_app/player/timer_picker/widgets/buttons.dart';

class TimerDisplay extends StatelessWidget {
  static final TextStyle timerTextStyle = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 60,
    ),
  );

  const TimerDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: TimerText(
                timerTextStyle: timerTextStyle,
              )),
          MainButton(
            text: const Text("Stop timer"),
            callback: (BuildContext context) =>
                Provider.of<TimerProvider>(context, listen: false).stopTimer(),
          )
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  final TextStyle timerTextStyle;

  const TimerText({super.key, required this.timerTextStyle});

  @override
  Widget build(BuildContext context) {
    int minutes = Provider.of<TimerProvider>(context).hours;
    int seconds = Provider.of<TimerProvider>(context).minutes;
    return Text(
      "${minutes >= 10 ? minutes : "0$minutes"} : ${seconds >= 10 ? seconds : "0$seconds"}",
      style: timerTextStyle,
    );
  }
}
