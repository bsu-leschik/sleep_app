import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_scroll/text_scroll.dart';

import '../widget/sound_property.dart';

class _MusicItemState extends State<MusicItem> {
  final BoxDecoration ifPlaying = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(color: Color.fromRGBO(151, 71, 255, 1), blurRadius: 8)
      ],
      border:
          Border.all(color: const Color.fromRGBO(126, 68, 250, 1), width: 1));
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 102,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              isPlaying = !isPlaying;
            }),
            child: SizedBox(
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
                              decoration: isPlaying ? ifPlaying : null,
                              width: 78,
                              height: 78,
                              child: widget.image,
                            ),
                          ),
                        ),
                        Positioned(right: 14, child: widget.soundProperty)
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
                        velocity:
                            const Velocity(pixelsPerSecond: Offset(30, 0)),
                        widget.title,
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
          ),
        ],
      ),
    );
  }
}

class MusicItem extends StatefulWidget {
  final String title;
  final Image image;
  final SoundProperty soundProperty;

  MusicItem(
      {required this.title,
      required this.image,
      required SoundProperties property,
      super.key})
      : soundProperty = SoundProperty(property);

  @override
  State<StatefulWidget> createState() => _MusicItemState();
}
