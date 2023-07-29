import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sleep_app/player/storage/music_storage/music_storage.dart';

import '../../storage/sounds_storage/sounds_storage.dart';
import 'widgets/mix_item_name.dart';
import '../side_menu/mix_item_sidebar.dart';
import 'widgets/sound_slider.dart';

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
      key: GlobalKey(),
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        key: GlobalKey(),
        extentRatio: 0.74,
        motion: const ScrollMotion(),
        dragDismissible: true,
        children: [
          MixItemSidebar(
              key: GlobalKey(),
              name: name,
              trashCallback: trashCallback,
              infoCallback: infoCallback,
              type: type)
        ],
      ),
      child: Padding(
        key: GlobalKey(),
        padding: const EdgeInsets.only(left: 26, right: 26),
        child: Row(
          key: GlobalKey(),
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            Expanded(
              key: GlobalKey(),
              child: Container(
                key: GlobalKey(),
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  key: GlobalKey(),
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      key: GlobalKey(),
                      margin: const EdgeInsets.only(left: 19, bottom: 14),
                      child: MixItemName(name: name),
                    ),
                    Container(
                      key: GlobalKey(),
                      margin: const EdgeInsets.only(left: 14),
                      child: SoundSlider(
                        key: GlobalKey(),
                        name: name,
                        callback: sliderCallback,
                      ),
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
