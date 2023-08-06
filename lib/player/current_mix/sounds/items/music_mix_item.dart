import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/current_mix/sounds/items/widgets/mix_music_icon.dart';

import '../../../storage/mixes/mixes_storage.dart';
import '../../../storage/music_storage/music_storage.dart';
import '../side_menu/info_dialog.dart';
import 'mix_item.dart';

class MusicMixItem extends StatelessWidget {
  final String name;

  const MusicMixItem({super.key, required this.name});

  _sliderMusicCallback(BuildContext context, double volume) =>
      Provider.of<MixesStorage>(context, listen: false).adjustVolume(volume);

  @override
  Widget build(BuildContext context) {
    return CurrentMixItem(
      name: name,
      isSound: false,
      icon: MixMusicIcon(name: name),
      infoCallback: (BuildContext context) => {
        showDialog(
          useRootNavigator: false,
          context: context,
          builder: (context) => InfoDialog(
            name: name,
            isMusic: true,
          ),
        )
      },
      sliderCallback: _sliderMusicCallback,
      type: MusicStorage,
    );
  }
}
