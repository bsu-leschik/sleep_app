import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sleep_app/player/storage/music_storage/music_storage.dart';

import '../../../storage/sounds_storage/sounds_storage.dart';
import 'widgets/mix_item_name.dart';
import '../side_menu/mix_item_sidebar.dart';
import 'widgets/sound_slider.dart';

class CurrentMixItem extends StatefulWidget {
  final String name;
  final Widget icon;
  final bool isSound;
  final Function(BuildContext) infoCallback;
  final Function(BuildContext, double) sliderCallback;
  final Type type;

  const CurrentMixItem({
    super.key,
    required this.name,
    required this.icon,
    required this.isSound,
    required this.infoCallback,
    required this.sliderCallback,
    required this.type,
  }) : assert(type == SoundsStorage || type == MusicStorage);

  @override
  State<CurrentMixItem> createState() => _CurrentMixItemState();
}

class _CurrentMixItemState extends State<CurrentMixItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        extentRatio: 0.74,
        motion: const ScrollMotion(),
        dragDismissible: true,
        children: [
          MixItemSidebar(
            deleteCallback: () => setState(() => {}),
            name: widget.name,
            isSound: widget.isSound,
            infoCallback: widget.infoCallback,
            type: widget.type,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 26, right: 26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widget.icon,
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
                      child: MixItemName(name: widget.name),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14),
                      child: SoundSlider(
                        name: widget.name,
                        callback: widget.sliderCallback,
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
