import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleep_app/timer_picker/widgets/sleep_time_picker.dart';

void main() => runApp(const PopupRouteApp());

class PopupRouteApp extends StatelessWidget {
  const PopupRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: PopupRouteExample(),
    );
  }
}

class PopupRouteExample extends StatelessWidget {
  const PopupRouteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 23, 51, 1),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(Timer<void>());
          },
          child: const Text('Open Timer'),
        ),
      ),
    );
  }
}

class Timer<T> extends PopupRoute<T> {
  @override
  Color? get barrierColor => const Color.fromRGBO(20, 23, 51, 0.5);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  static final TextStyle generalTextStyle = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 16,
      height: 22 / 16,
    ),
  );

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 350, 27, 181),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: const Color.fromRGBO(1, 48, 140, 1),
            border: Border.all(
              color: const Color.fromRGBO(126, 68, 250, 1),
              width: 1,
            ),
          ),
          child: SleepTimePicker(generalTextStyle: generalTextStyle)),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
