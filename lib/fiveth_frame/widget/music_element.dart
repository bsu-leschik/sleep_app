import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';

enum SoundProperties { locked, unlocked, favorite }

class _MusicElementState extends State<MusicElement> {
  final String _title;
  final Image _image;
  final SoundProperty soundProperty;

  static SoundProperty _getSoundProperty(SoundProperties properties) {
    switch (properties) {
      case SoundProperties.locked:
        return const SoundProperty(Icons.lock, Color.fromRGBO(0, 50, 47, 1));
      case SoundProperties.unlocked:
        return const SoundProperty(
            Icons.favorite_border, Color.fromRGBO(0, 50, 47, 1));
      case SoundProperties.favorite:
        return const SoundProperty(
            Icons.favorite, Color.fromRGBO(203, 9, 67, 1));
    }
  }

  _MusicElementState(this._title, this._image, SoundProperties property)
      : soundProperty = _getSoundProperty(property);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 112,
          height: 102,
          child: Stack(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                width: 78,
                height: 78,
                child: _image,
              ),
              Positioned(right: 14, child: soundProperty)
            ],
          ),
        ),
        SizedBox(
          width: 112,
          child: Center(
            child: TextScroll(
              delayBefore: const Duration(seconds: 1),
              pauseBetween: const Duration(seconds: 3),
              fadedBorder: true,
              velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
              _title,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 17.37 / 12,
                  color: Color(0xFF8E9FCC),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MusicElement extends StatefulWidget {
  final String _title;
  final Image _image;
  final SoundProperties property;

  const MusicElement(this._title, this._image, this.property, {super.key});

  @override
  State<StatefulWidget> createState() =>
      _MusicElementState(this._title, this._image, this.property);
}

class SoundProperty extends StatelessWidget {
  final IconData icon;
  final Color background;

  const SoundProperty(this.icon, this.background, {super.key});

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
