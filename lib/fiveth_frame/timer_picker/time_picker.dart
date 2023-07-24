import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/timer_picker/provider/timer_provider.dart';
import 'package:sleep_app/fiveth_frame/timer_picker/timer_display.dart';
import 'package:sleep_app/fiveth_frame/timer_picker/widgets/buttons.dart';
import 'package:sleep_app/fiveth_frame/timer_picker/widgets/sleep_time_picker.dart';

class TimerRoute<T> extends ModalRoute<T> {
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
    ),
  );

  @override
  RouteSettings settings;

  TimerRoute(this.settings);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    Widget mainWidget;
    double top, height;
    if (Provider.of<TimerProvider>(context).started) {
      mainWidget = const TimerDisplay();
      top = 423;
      height = 240;
    } else {
      mainWidget = SleepTimePicker();
      top = 350;
      height = 313;
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(top: top, left: 27),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              width: 336,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color.fromRGBO(1, 48, 140, 1),
                border: Border.all(
                  color: const Color.fromRGBO(126, 68, 250, 1),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                      right: 25, top: 25, child: CrossExitButton()),
                  mainWidget,
                ],
              )),
        ),
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;
}

class TimerPage<T> extends Page<T> {
  @override
  Route<T> createRoute(BuildContext context) {
    return TimerRoute<T>(this);
  }
}
