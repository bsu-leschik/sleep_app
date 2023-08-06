import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';
import 'package:sleep_app/player/storage/sounds_storage/sounds_storage.dart';
import 'package:sleep_app/player/music_chooser/music_types_bar/choose_music_bar_model.dart';

import '../../storage/sounds_storage/sound_item.dart';
import 'sound_property.dart';

class SoundItemWidget extends StatelessWidget {
  final String title;
  final SoundProperties property;
  final SoundType type;
  final String info;

  const SoundItemWidget(
      {required this.property,
      required this.title,
      required this.type,
      required this.info,
      super.key});

  factory SoundItemWidget.fromSoundItem(SoundItem item) => SoundItemWidget(
        title: item.title,
        property: item.property,
        type: item.type,
        info: item.info,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      height: 99,
      child: GestureDetector(
        onTap: () {
          if (!Provider.of<MixesStorage>(context, listen: false)
              .addSound(SoundItem.fromWidget(this))) {
            context.push('/ad/sound/$title');
          }
        },
        child: Stack(
          children: [
            NamedSoundItemIcon(title: title),
            Positioned(
                top: 0, right: 0, child: SoundProperty(title, SoundsStorage)),
          ],
        ),
      ),
    );
  }
}

class NamedSoundItemIcon extends StatelessWidget {
  const NamedSoundItemIcon({
    super.key,
    this.updating = true,
    required this.title,
  });

  final bool updating;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SoundItemIcon(title: title, updating: updating),
        Text(title,
            maxLines: 1,
            style: GoogleFonts.nunito(
              color: const Color.fromRGBO(142, 159, 204, 1),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}

class SoundItemIcon extends StatelessWidget {
  const SoundItemIcon({
    super.key,
    required this.title,
    this.updating = true,
  });

  final String title;
  final bool updating;

  @override
  Widget build(BuildContext context) {
    Color color;
    if (updating) {
      color = Provider.of<MixesStorage>(context).player.isTitlePlaying(title)
          ? const Color.fromRGBO(151, 71, 255, 1)
          : Colors.transparent;
    } else {
      color = Colors.transparent;
    }

    return Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        border: Border.all(
          color: const Color(0xFF8E9FCC),
          width: 1,
        ),
      ),
      child: Image.asset("assets/images/Fire.png"),
    );
  }
}
