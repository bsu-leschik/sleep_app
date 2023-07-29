import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/current_mix/items/widgets/mix_music_icon.dart';

import '../../storage/mixes/mixes_storage.dart';
import '../../storage/music_storage/music_storage.dart';
import '../side_menu/info_dialog.dart';
import 'mix_item.dart';

class MusicMixItem extends StatelessWidget {
  final String name;

  MusicMixItem({super.key, required this.name});

  final _musicFunctions = [
    (BuildContext context) =>
        Provider.of<MixesStorage>(context, listen: false).remove(),
  ];
  _sliderMusicCallback(BuildContext context, double volume) =>
      Provider.of<MixesStorage>(context, listen: false).adjustVolume(volume);

  @override
  Widget build(BuildContext context) {
    return MixItem(
      name: name,
      trashCallback: _musicFunctions[0],
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
