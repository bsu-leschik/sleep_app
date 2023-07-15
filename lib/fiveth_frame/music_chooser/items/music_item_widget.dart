import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/play_controller.dart';
import 'package:sleep_app/fiveth_frame/storage/music_storage/music_storage.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../storage/music_storage/music_item.dart';
import 'sound_property.dart';

class MusicItemWidgetState extends State<MusicItemWidget> {
  bool isPlaying = false;

  final BoxDecoration ifPlaying = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(color: Color.fromRGBO(151, 71, 255, 1), blurRadius: 8)
      ],
      border:
          Border.all(color: const Color.fromRGBO(126, 68, 250, 1), width: 1));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 102,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              if (Provider.of<PlayController>(context, listen: false)
                  .playMusic(widget)) {}
            }),
            child: SizedBox(
              width: 112,
              height: 102,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Center(
                          child: Container(
                            decoration: Provider.of<PlayController>(context)
                                        .musicPlaying ==
                                    widget.title
                                ? ifPlaying
                                : null,
                            width: 78,
                            height: 78,
                            child: Image(
                              image: AssetImage(widget.imageRoute),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 14,
                            child: SoundProperty(widget.title, MusicStorage))
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

class MusicItemWidget extends StatefulWidget {
  final String title;
  final SoundProperties property;
  final String imageRoute;

  const MusicItemWidget(
      {super.key,
      required this.title,
      required this.property,
      required this.imageRoute});

  factory MusicItemWidget.fromMusicItem(MusicItem item) => MusicItemWidget(
        title: item.title,
        property: item.property,
        imageRoute: item.imageRoute,
      );

  @override
  State<StatefulWidget> createState() => MusicItemWidgetState();
}
