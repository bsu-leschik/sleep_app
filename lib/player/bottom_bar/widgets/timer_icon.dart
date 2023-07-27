import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/timer_picker/provider/timer_provider.dart';

class TimerIcon extends StatelessWidget {
  const TimerIcon({super.key});

  static const _imagePath = "assets/images/bottom_bar/timer.png";

  @override
  Widget build(BuildContext context) {
    var minutes = Provider.of<TimerProvider>(context).minutes;
    var hours = Provider.of<TimerProvider>(context).hours;
    if (Provider.of<TimerProvider>(context).started) {
      return Text(
        "${hours >= 10 ? hours : "0$hours"}:${minutes >= 10 ? minutes : "0$minutes"}",
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w400,
        ),
      );
    } else {
      return const SizedBox(
          width: 30, height: 30, child: Image(image: AssetImage(_imagePath)));
    }
  }
}
