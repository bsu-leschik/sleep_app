import 'package:flutter/material.dart';

class MoonSheepCloud extends StatelessWidget {
  const MoonSheepCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 7,
              child: Image.asset(
                "assets/images/premium/Moon3x.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
        Align(
          alignment: const Alignment(-1, 68 / 796 * 2 - 1),
          child: Image.asset("assets/images/premium/sky.png"),
        ),
      ],
    );
  }
}
