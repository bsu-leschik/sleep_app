import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sleep_app/fiveth_frame/current_mix/music_mix/info_icon.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';
import 'package:sleep_app/fiveth_frame/storage/music_storage/music_storage.dart';

import 'mix_item_name.dart';
import 'mix_music_icon.dart';
import 'sound_slider.dart';

class MusicMixItem extends StatelessWidget {
  final String name;
  const MusicMixItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      useTextDirection: true,
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        extentRatio: 0.74,
        motion: const ScrollMotion(),
        children: [
          Expanded(
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
                    child: SoundProperty(name, MusicStorage,
                        size: SoundPropertySize.big),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: SideIcon(
                        icon: Image(
                            image: AssetImage("assets/images/mix/info.png"))),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: SideIcon(
                        icon: Image(
                            image: AssetImage("assets/images/mix/trash.png"))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.only(right: 26),
        child: Row(
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
                      child: SoundSlider(name: name, type: "music"),
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
