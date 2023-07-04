import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_app/timer_picker/widgets/pickers.dart';

import 'buttons.dart';

class SleepTimePicker extends StatelessWidget {
  const SleepTimePicker({
    super.key,
    required this.generalTextStyle,
  });

  final TextStyle generalTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 77),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 39),
                child: DecoratedTimePicker(generalTextStyle: generalTextStyle),
              ),
              Container(
                margin: const EdgeInsets.only(left: 32, top: 25),
                child: const CrossExitButton(),
              ),
            ],
          ),
        ),
        const TimerButtons()
      ],
    );
  }
}
