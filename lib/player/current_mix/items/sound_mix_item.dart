import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../music_chooser/items/sound_item_widget.dart';
import '../../storage/mixes/mixes_storage.dart';
import '../../storage/sounds_storage/sounds_storage.dart';
import '../side_menu/info_dialog.dart';
import 'mix_item.dart';

class SoundMixItem extends StatelessWidget {
  final _soundFunctions = List.empty(growable: true);
  _sliderSoundCallback(BuildContext context, double volume) =>
      Provider.of<MixesStorage>(context, listen: false)
          .adjustVolume(volume, name: name);

  final String name;

  SoundMixItem({super.key, required this.name}) {
    _soundFunctions.add((BuildContext context) =>
        Provider.of<MixesStorage>(context, listen: false).remove(title: name));
  }

  @override
  Widget build(BuildContext context) {
    return MixItem(
      name: name,
      isSound: true,
      icon: SoundItemIcon(
        title: name,
        updating: false,
      ),
      infoCallback: (BuildContext context) => {
        showDialog(
          useRootNavigator: false,
          context: context,
          builder: (context) => InfoDialog(name: name),
        )
      },
      sliderCallback: _sliderSoundCallback,
      type: SoundsStorage,
    );
  }
}
