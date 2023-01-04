import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  const OnboardingWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 33,
            fontWeight: FontWeight.w400,
            height: 45 / 33,
          ),
        ),
        const Expanded(
          flex: 2,
          child: SizedBox(),
        ),
      ],
    );
  }
}
