import 'package:flutter/material.dart';

enum SoundProperties { locked, unlocked, favorite }

class SoundProperty extends StatelessWidget {
  final SoundProperties property;
  final IconData icon;
  final Color background;
  static const Color _blue = Color.fromRGBO(0, 50, 147, 1);
  static const Color _red = Color.fromRGBO(203, 9, 67, 1);

  factory SoundProperty(SoundProperties property) {
    switch (property) {
      case SoundProperties.locked:
        return SoundProperty._create(Icons.lock, _blue, property);
      case SoundProperties.unlocked:
        return SoundProperty._create(Icons.favorite_border, _blue, property);
      case SoundProperties.favorite:
        return SoundProperty._create(Icons.favorite, _red, property);
    }
  }

  const SoundProperty._create(this.icon, this.background, this.property,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 27,
      height: 27,
      child: CircleAvatar(
        backgroundColor: background,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Icon(
            icon,
            size: 15,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
