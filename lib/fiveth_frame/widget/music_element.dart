import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';

enum SoundProperties { locked, unlocked, favorite }

class _MusicElementState extends State<MusicElement> {
  final String _title;
  final Image _image;
  final SoundProperty soundProperty;
  static const Color blue = Color.fromRGBO(0, 50, 147, 1);
  static const Color red = Color.fromRGBO(203, 9, 67, 1);

  static SoundProperty _getSoundProperty(SoundProperties properties) {
    switch (properties) {
      case SoundProperties.locked:
        return const SoundProperty(Icons.lock, blue);
      case SoundProperties.unlocked:
        return const SoundProperty(Icons.favorite_border, blue);
      case SoundProperties.favorite:
        return const SoundProperty(Icons.favorite, red);
    }
  }

  _MusicElementState(this._title, this._image, SoundProperties property)
      : soundProperty = _getSoundProperty(property);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 102,
      child: Row(
        children: [
          SizedBox(
            width: 112,
            height: 102,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 3, left: 17, right: 17, bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  // BoxShadow(
                                  //     color: Color.fromRGBO(151, 71, 255, 1),
                                  //     blurRadius: 8)
                                ],
                                border: Border.all(
                                    color: Color.fromRGBO(126, 68, 250, 1),
                                    width: 1)),
                            width: 78,
                            height: 78,
                            child: _image,
                          ),
                        ),
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
            ),
          ),
        ],
      ),
    );
  }
}

class MusicElement extends StatefulWidget {
  final String title;
  final Image image;
  final SoundProperties property;

  const MusicElement(
      {required this.title,
      required this.image,
      required this.property,
      super.key});

  @override
  State<StatefulWidget> createState() =>
      _MusicElementState(this.title, this.image, this.property);
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
