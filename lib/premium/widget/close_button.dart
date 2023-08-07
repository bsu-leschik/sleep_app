import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CloseButt extends StatelessWidget {
  const CloseButt({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Icon(
        Icons.close_rounded,
        color: Color(0xFFFFFFFF),
        size: 30,
      ),
      onTap: () => context.go('/player'),
    );
  }
}
