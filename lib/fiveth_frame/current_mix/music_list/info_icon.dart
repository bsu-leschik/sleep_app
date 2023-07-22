import 'package:flutter/material.dart';

class SideIcon extends StatelessWidget {
  final Image icon;
  final Function(BuildContext) callback;
  const SideIcon({required this.icon, required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback(context),
      child: SizedBox(
        width: 52,
        height: 52,
        child: icon,
      ),
    );
  }
}
