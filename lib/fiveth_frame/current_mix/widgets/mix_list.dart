import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/current_mix/widgets/unlock_music.dart';
import 'package:sleep_app/fiveth_frame/storage/mixes/mixes_storage.dart';

import 'music_mix_item.dart';

class MixList extends StatelessWidget {
  const MixList({super.key});

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    var name = Provider.of<MixesStorage>(context).musicPlayingName;
    if (name != null) {
      list.add(MusicMixItem(name: name));
    }
    return Column(
      children: list,
    );
  }
}
