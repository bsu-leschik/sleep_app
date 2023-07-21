import 'package:flutter/material.dart';

class SideIcon extends StatelessWidget {
  final Image icon;
  const SideIcon({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 52,
      child: icon,
    );
  }
}
