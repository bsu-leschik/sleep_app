import 'package:flutter/widgets.dart';
import 'package:sleep_app/fiveth_frame/elements/music_item.dart';

import '../widget/sound_property.dart';

class TypesListModel {
  static final List<MusicItem> list = [
    MusicItem(
      image:
          const Image(image: AssetImage("assets/images/music/Mediative.png")),
      title: "Mediative space",
      property: SoundProperties.locked,
    ),
    MusicItem(
      image:
          const Image(image: AssetImage("assets/images/music/Moonmusic.png")),
      title: "Moon vibes",
      property: SoundProperties.locked,
    ),
    MusicItem(
      image: const Image(image: AssetImage("assets/images/music/Peaceful.png")),
      title: "Peaceful and calm",
      property: SoundProperties.locked,
    ),
    MusicItem(
      image: const Image(image: AssetImage("assets/images/music/Tropical.png")),
      title: "Tropical",
      property: SoundProperties.locked,
    ),
    MusicItem(
      image: const Image(image: AssetImage("assets/images/music/Winter.png")),
      title: "Winter",
      property: SoundProperties.locked,
    ),
  ];

  static List<MusicItem> getList() {
    return list;
  }
}
