import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleep_app/player/ads/widgets/ad_widget.dart';
import 'package:sleep_app/player/timer_picker/widgets/buttons.dart';

class AdRoute<T> extends ModalRoute<T> {
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

  String type, trackName;

  AdRoute(this.settings, this.type, this.trackName);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 160, left: 27),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              width: 336,
              height: 503,
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
                  Center(child: AdWidget(type: type, title: trackName)),
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

class AdPage<T> extends Page<T> {
  final String trackName;
  final String type;

  const AdPage(this.type, this.trackName);

  @override
  Route<T> createRoute(BuildContext context) {
    return AdRoute<T>(this, type, trackName);
  }
}
