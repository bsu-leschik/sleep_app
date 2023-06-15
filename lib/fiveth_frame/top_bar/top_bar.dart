import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "Melodies for sleep",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontFamily: 'Poetsen',
              fontWeight: FontWeight.w400,
              fontSize: 23,
              height: 23.6 / 23,
            ),
          ),
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFF003293),
          child: InkWell(
            onTap: () {
              context.push('/settings');
            },
            child: const Icon(
              Icons.settings,
              color: Color(0xFFFFFFFF),
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
