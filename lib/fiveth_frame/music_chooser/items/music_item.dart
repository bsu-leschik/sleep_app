import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/play_controller.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/music_storage.dart';
import 'package:text_scroll/text_scroll.dart';

import 'sound_property.dart';

class MusicItemState extends AbstractItemState<MusicItem> {
  bool isPlaying = false;

  SoundProperties? currentProperty;

  _callback(BuildContext context) {
    callback(context);
    Provider.of<MusicStorage>(context).save(this);
  }

  displayPlaying(bool playing) {
    setState(() {
      isPlaying = playing;
    });
  }

  final BoxDecoration ifPlaying = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(color: Color.fromRGBO(151, 71, 255, 1), blurRadius: 8)
      ],
      border:
          Border.all(color: const Color.fromRGBO(126, 68, 250, 1), width: 1));

  @override
  Widget build(BuildContext context) {
    currentProperty ??= widget.property;
    return SizedBox(
      width: 112,
      height: 102,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              if (PlayController.playMusic(this)) {
                isPlaying = !isPlaying;
              }
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
                        Positioned(
                            right: 14,
                            child: SoundProperty(currentProperty!, _callback))
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

  @override
  Map<String, dynamic> toJson() => {
        'soundProperty': currentProperty == null
            ? widget.property.index
            : currentProperty!.index,
        'image': widget.image,
        'title': widget.title
      };
}

class MusicItem extends StatefulWidget {
  final String title;
  final Image image;
  final SoundProperties property;
  final String imageRoute;

  MusicItem.fromJson(Map<String, dynamic> json, {super.key})
      : property = SoundProperties.values[json['property'] as int],
        imageRoute = json['image'] as String,
        image = Image(image: AssetImage(json['image'] as String)),
        title = json['title'] as String;

  @override
  State<StatefulWidget> createState() => MusicItemState();
}
