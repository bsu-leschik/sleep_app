import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MixTopBar extends StatelessWidget {
  const MixTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Current mix",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Poetsen',
            fontWeight: FontWeight.w400,
            fontSize: 23,
            height: 27.6 / 23,
          ),
        ),
        InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.close,
            color: Color(0xFFFFFFFF),
            size: 25,
          ),
        ),
      ],
    );
  }
}
