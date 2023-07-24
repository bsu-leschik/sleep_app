import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleep_app/fiveth_frame/timer_picker/widgets/buttons.dart';

class TimerDisplay<T> extends PopupRoute<T> {
  int minutes, seconds;
  @override
  Color? get barrierColor => const Color.fromRGBO(20, 23, 51, 0.5);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  static final TextStyle timerTextStyle = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 60,
      height: 22 / 16,
    ),
  );

  TimerText timerText;

  TimerDisplay({required this.minutes, required this.seconds})
      : timerText = TimerText(
            minutes: minutes, seconds: seconds, timerTextStyle: timerTextStyle);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(27, 387, 27, 181),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: const Color.fromRGBO(1, 48, 140, 1),
              border: Border.all(
                color: const Color.fromRGBO(126, 68, 250, 1),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 25, right: 25),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CrossExitButton(),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: timerText),
                MainButton(
                    text: const Text("Stop timer"),
                    callback: () => timerText.stopTimer())
              ],
            ),
          ),
        ));
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class _TimerTextState extends State<TimerText> {
  Timer? minutesTimer, secondsTimer;
  int minutes = -1, seconds = -1;
  _TimerTextState();

  @override
  Widget build(BuildContext context) {
    if (minutes < 0) minutes = widget.minutes;
    if (seconds < 0) seconds = widget.seconds;
    minutesTimer ??= Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        minutes--;
      });
    });
    secondsTimer ??= Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        seconds--;
      });
    });
    if (minutes <= 0) {
      minutesTimer!.cancel();
    }
    if (seconds <= 0) {
      secondsTimer!.cancel();
    }
    return Text(
      "${minutes >= 10 ? minutes : "0$minutes"} : ${seconds >= 10 ? seconds : "0$seconds"}",
      style: widget.timerTextStyle,
    );
  }
}

class TimerText extends StatefulWidget {
  final int minutes, seconds;
  final TextStyle timerTextStyle;
  final _TimerTextState _timerText;

  TimerText(
      {super.key,
      required this.minutes,
      required this.seconds,
      required this.timerTextStyle})
      : _timerText = _TimerTextState() {
    assert(minutes >= 0);
    assert(seconds >= 0);
  }

  @override
  State<StatefulWidget> createState() => _timerText;

  void stopTimer() {
    _timerText.minutesTimer?.cancel();
    _timerText.secondsTimer?.cancel();
  }
}
