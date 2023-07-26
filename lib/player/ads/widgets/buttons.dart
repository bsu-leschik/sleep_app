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
          MainButton(
            text: const Text(
              'Go PREMIUM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
            callback: (p0) => "",
          ),
          TransparentButton(
              text: const Text(
                'Watch ad',
                style: TextStyle(
                  color: Color(0xFF8E9FCC),
                  fontSize: 16,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                ),
              ),
              callback: () => "")
        ]);
  }
}
