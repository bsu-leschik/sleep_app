import 'package:flutter/material.dart';

import '../music_mix/mix_item_name.dart';
import '../music_mix/mix_music_icon.dart';
import '../music_mix/sound_slider.dart';

class MusicMixItem extends StatelessWidget {
  final String name;
  const MusicMixItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MixMusicIcon(name: name),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 19, bottom: 14),
                  child: MixItemName(name: name),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  child: SoundSlider(name: name),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
