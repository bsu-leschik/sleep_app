import 'package:flutter/material.dart';

class AdTitle extends StatelessWidget {
  const AdTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Try it for free!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 23,
        fontFamily: 'Poetsen',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
