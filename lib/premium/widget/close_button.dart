import 'package:flutter/material.dart';

import '../../subscription_widget/bottom_bar/bottom_bar.dart';

class CloseButt extends StatelessWidget {
  const CloseButt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          child: const Icon(
            Icons.close,
            color: Color(0xFFFFFFFF),
            size: 20,
          ),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomBar()),
            )
          },
        ),
        const SizedBox(
          width: 30,
        )
      ],
    );
  }
}
