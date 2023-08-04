import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/timer_picker/provider/timer_provider.dart';

class ColoredButton extends StatelessWidget {
  final String text;
  final Function(BuildContext) callback;

  const ColoredButton({super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {callback(context)},
        style: ButtonStyle(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
          child: Text(text),
        ));
  }
}

class TransparentButton extends StatelessWidget {
  final String text;
  final Function callback;
  const TransparentButton(
      {super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => {callback(context)},
        style: ButtonStyle(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
          child: Text(text),
        ));
  }
}

class TimerButtons extends StatelessWidget {
  void _mainButtonCallback(BuildContext context) {
    Provider.of<TimerProvider>(context, listen: false).startTimer();
  }

  const TimerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: ColoredButton(text: "Start", callback: _mainButtonCallback),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: TransparentButton(
            text: "Clear",
            callback: (p0) =>
                Provider.of<TimerProvider>(context, listen: false).clear(),
          ),
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
