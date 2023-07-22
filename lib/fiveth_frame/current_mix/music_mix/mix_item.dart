import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/current_mix/music_mix/info_icon.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';
import 'package:sleep_app/fiveth_frame/storage/music_storage/music_storage.dart';

import '../../music_chooser/items/sound_item_widget.dart';
import '../../storage/mixes/mixes_storage.dart';
import '../../storage/sounds_storage/sounds_storage.dart';
import 'mix_item_name.dart';
import 'mix_music_icon.dart';
import 'sound_slider.dart';

class MusicMixItem extends StatelessWidget {
  final String name;

  MusicMixItem({super.key, required this.name});

  final _musicFunctions = [
    (BuildContext context) => Provider.of<MixesStorage>(context).remove(),
    (BuildContext context) => {},
  ];
  _sliderMusicCallback(BuildContext context, double volume) =>
      Provider.of<MixesStorage>(context).adjustVolume(volume);

  @override
  Widget build(BuildContext context) {
    return MixItem(
      name: name,
      trashCallback: _musicFunctions[0],
      icon: MixMusicIcon(name: name),
      infoCallback: _musicFunctions[1],
      sliderCallback: _sliderMusicCallback,
      type: MusicStorage,
    );
  }
}

class SoundMixItem extends StatelessWidget {
  final _soundFunctions = List.empty(growable: true);
  _sliderSoundCallback(BuildContext context, double volume) =>
      Provider.of<MixesStorage>(context).adjustVolume(volume, name: name);

  final String name;

  SoundMixItem({super.key, required this.name}) {
    _soundFunctions.add((BuildContext context) =>
        Provider.of<MixesStorage>(context).remove(title: name));
    _soundFunctions.add((BuildContext context) => {});
  }

  @override
  Widget build(BuildContext context) {
    return MixItem(
      name: name,
      trashCallback: _soundFunctions[0],
      icon: SoundIcon(name: name),
      infoCallback: _soundFunctions[1],
      sliderCallback: _sliderSoundCallback,
      type: SoundsStorage,
    );
  }
}

class MixItem extends StatelessWidget {
  final String name;
  final Widget icon;
  final Function(BuildContext) trashCallback;
  final Function(BuildContext) infoCallback;
  final Function(BuildContext, double) sliderCallback;
  final Type type;
  const MixItem({
    super.key,
    required this.name,
    required this.icon,
    required this.trashCallback,
    required this.infoCallback,
    required this.sliderCallback,
    required this.type,
  }) : assert(type == SoundsStorage || type == MusicStorage);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        extentRatio: 0.74,
        motion: const ScrollMotion(),
        children: [
          MixItemSidebar(
              name: name,
              trashCallback: trashCallback,
              infoCallback: infoCallback,
              type: type)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
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
                      child: SoundSlider(name: name, callback: sliderCallback),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MixItemSidebar extends StatelessWidget {
  const MixItemSidebar({
    super.key,
    required this.name,
    required this.trashCallback,
    required this.infoCallback,
    required this.type,
  }) : assert(type == SoundsStorage || type == MusicStorage);

  final String name;
  final Function(BuildContext) trashCallback;
  final Function(BuildContext) infoCallback;
  final Type type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 78,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
          color: Color.fromRGBO(12, 14, 31, 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SoundProperty(name, type, size: SoundPropertySize.big),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: SideIcon(
                  icon: Image(image: AssetImage("assets/images/mix/info.png"))),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 36),
              child: SideIcon(
                  icon:
                      Image(image: AssetImage("assets/images/mix/trash.png"))),
            )
          ],
        ),
      ),
    );
  }
}
