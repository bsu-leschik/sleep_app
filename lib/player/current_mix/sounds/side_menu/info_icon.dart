import 'package:flutter/material.dart';

class SideIcon extends StatefulWidget {
  final Image icon;
  final Function(BuildContext) callback;
  const SideIcon({required this.icon, required this.callback, super.key});

  @override
  State<SideIcon> createState() => _SideIconState();
}

class _SideIconState extends State<SideIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 52,
      child: GestureDetector(
          onTap: () => setState(() {
                widget.callback(context);
              }),
          child: widget.icon),
    );
  }
}
