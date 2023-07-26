import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/music_chooser/items/music_item_widget.dart';

import 'items/sound_item_widget.dart';
import 'music_themes/types_list.dart';
import '../storage/music_storage/music_storage.dart';
import '../storage/sounds_storage/sounds_storage.dart';

class MusicChooser extends StatelessWidget {
  const MusicChooser({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    var musicList = Provider.of<MusicStorage>(context).musicList;
    var musicWidgetList = List<MusicItemWidget>.generate(musicList.length,
        (index) => MusicItemWidget.fromMusicItem(musicList[index]));
    var soundsList = Provider.of<SoundsStorage>(context).currentList;
    var soundsWidgetList = List<SoundItemWidget>.generate(soundsList.length,
        (index) => SoundItemWidget.fromSoundItem(soundsList[index]));

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              color: Colors.transparent,
              width: double.infinity,
              child: TypesList(musicWidgetList)),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: const Divider(
              color: Color.fromRGBO(142, 159, 204, 0.5),
              thickness: 1,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TypesList(
              soundsWidgetList,
              spacing: 35,
            ),
          ),
        ],
      ),
    );
  }
}
