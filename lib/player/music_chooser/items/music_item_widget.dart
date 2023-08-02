import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';
import 'package:sleep_app/player/storage/music_storage/music_storage.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../storage/music_storage/music_item.dart';
import 'sound_property.dart';

class MusicItemWidgetState extends State<MusicItemWidget> {
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
              if (!Provider.of<MixesStorage>(context, listen: false)
                  .addMusic(MusicItem.fromWidget(widget))) {
                context.push('/ad/music/${widget.title}');
              }
            }),
            child: SizedBox(
              width: 112,
              height: 102,
              child: Stack(
                children: [
                  NamedMusicItemIcon(
                    title: widget.title,
                    imageRoute: widget.imageRoute,
                  ),
                  Positioned(
                      right: 14,
                      child: SoundProperty(widget.title, MusicStorage))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NamedMusicItemIcon extends StatelessWidget {
  const NamedMusicItemIcon({
    super.key,
    required this.title,
    required this.imageRoute,
    this.updating = true,
  });

  final String title;
  final String imageRoute;
  final bool updating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: MusicItemIcon(
              title: title,
              imageRoute: imageRoute,
              updating: updating,
            ),
          ),
        ),
        MusicItemTitle(title: title),
      ],
    );
  }
}

class MusicItemIcon extends StatelessWidget {
  MusicItemIcon({
    super.key,
    required this.title,
    required this.imageRoute,
    this.updating = true,
  });

  final BoxDecoration ifPlaying = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(color: Color.fromRGBO(151, 71, 255, 1), blurRadius: 8)
      ],
      border:
          Border.all(color: const Color.fromRGBO(126, 68, 250, 1), width: 1));

  final String title;
  final String imageRoute;
  final bool updating;

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;
    if (updating) {
      decoration = Provider.of<MixesStorage>(context).musicPlayingName == title
          ? ifPlaying
          : null;
    } else {
      decoration = null;
    }
    return Container(
      decoration: decoration,
      width: 78,
      height: 78,
      child: Image(
        image: AssetImage(imageRoute),
      ),
    );
  }
}

class MusicItemTitle extends StatelessWidget {
  const MusicItemTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      child: Center(
        child: TextScroll(
          delayBefore: const Duration(seconds: 1),
          pauseBetween: const Duration(seconds: 3),
          fadedBorder: true,
          velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
          title,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFF8E9FCC),
            ),
          ),
        ),
      ),
    );
  }
}

class MusicItemWidget extends StatefulWidget {
  final String title;
  final SoundProperties property;
  final String imageRoute;
  final String info;

  const MusicItemWidget(
      {super.key,
      required this.title,
      required this.property,
      required this.imageRoute,
      required this.info});

  factory MusicItemWidget.fromMusicItem(MusicItem item) => MusicItemWidget(
        title: item.title,
        property: item.property,
        imageRoute: item.imageRoute,
        info: item.info,
      );

  @override
  State<StatefulWidget> createState() => MusicItemWidgetState();
}
