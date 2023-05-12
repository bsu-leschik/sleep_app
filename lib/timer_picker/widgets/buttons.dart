import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleep_app/timer_picker/sleep_timer.dart';
import 'package:sleep_app/timer_picker/timer_display.dart';

class _MainButtonState extends State<MainButton> {
  Text text;
  VoidCallback callback;
  _MainButtonState({required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: callback,
        style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(Size(130, 42)),
          backgroundColor: const MaterialStatePropertyAll(
            Color.fromRGBO(126, 68, 250, 1),
          ),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(33))),
          textStyle: MaterialStatePropertyAll(GoogleFonts.nunito(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          )),
        ),
        child: text);
  }
}

class MainButton extends StatefulWidget {
  final Text text;
  final VoidCallback callback;

  const MainButton({super.key, required this.text, required this.callback});

  @override
  State<StatefulWidget> createState() =>
      _MainButtonState(text: text, callback: callback);
}

class _TransparentButtonState extends State<TransparentButton> {
  Text text;

  _TransparentButtonState({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => 1,
        style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(Size(130, 42)),
          backgroundColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
          side: const MaterialStatePropertyAll(BorderSide(
            color: Color.fromRGBO(142, 159, 204, 1),
          )),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(33))),
          textStyle: MaterialStatePropertyAll(GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Color.fromRGBO(142, 159, 204, 1),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          )),
        ),
        child: text);
  }
}

class TransparentButton extends StatefulWidget {
  final Text text;

  const TransparentButton({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => _TransparentButtonState(text: text);
}

class TimerButtons extends StatelessWidget {
  const TimerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7, bottom: 14),
          child: MainButton(
              text: const Text("Start"),
              callback: () {
                Navigator.pushReplacement(
                    context, TimerDisplay(minutes: 0, seconds: 0));
              }),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 7, bottom: 14),
          child: TransparentButton(text: Text("Clear")),
        ),
      ],
    );
  }
}

class CrossExitButton extends StatelessWidget {
  const CrossExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => context.pop(),
        child: const Icon(
          CupertinoIcons.xmark,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
