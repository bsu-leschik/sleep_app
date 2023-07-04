import 'package:flutter/material.dart';

enum SoundProperties {
  locked,
  unlocked,
  favorite;

  static const Color _blue = Color.fromRGBO(0, 50, 147, 1);
  static const Color _red = Color.fromRGBO(203, 9, 67, 1);

  IconData getIcon() {
    switch (this) {
      case locked:
        return Icons.lock;
      case unlocked:
        return Icons.favorite_border;
      case favorite:
        return Icons.favorite;
    }
  }

  Color getColor() {
    switch (this) {
      case locked:
        return SoundProperties._blue;
      case unlocked:
        return SoundProperties._blue;
      case favorite:
        return SoundProperties._red;
    }
  }
}

class _SoundPropertyState extends State<SoundProperty> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 27,
      height: 27,
      child: CircleAvatar(
        backgroundColor: widget.property.getColor(),
        child: GestureDetector(
          onTap: () => {widget.action(context)},
          child: FittedBox(
            fit: BoxFit.contain,
            child: Icon(
              widget.property.getIcon(),
              size: 15,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}

class SoundProperty extends StatefulWidget {
  final SoundProperties property;
  final Function action;

  const SoundProperty(this.property, this.action, {super.key});

  @override
  State<StatefulWidget> createState() => _SoundPropertyState();
}
