import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';

import '../music_list/mix_item.dart';

class MixList extends StatelessWidget {
  const MixList({super.key});

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    var mix = Provider.of<MixesStorage>(context).mix;
    var name = Provider.of<MixesStorage>(context).musicPlayingName;
    if (name != null) {
      list.add(MusicMixItem(name: name));
    }
    mix.sounds.forEach((key, value) {
      list.add(SoundMixItem(name: key));
    });
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => list[index],
            itemCount: list.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}
