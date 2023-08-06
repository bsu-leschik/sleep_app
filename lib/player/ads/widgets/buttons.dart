import 'package:flutter/material.dart';

import '../../timer_picker/widgets/buttons.dart';

class AdButtons extends StatelessWidget {
  const AdButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ColoredButton(
            text: 'Go PREMIUM',
            callback: (p0) => "",
          ),
          TransparentButton(text: 'Watch ad', callback: () => "")
        ]);
  }
}
