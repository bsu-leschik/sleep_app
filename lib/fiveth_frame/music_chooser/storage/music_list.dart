import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';

import '../items/music_item.dart';

const String musicFolder = "assets/images/music/";

const List<MusicItem> music = [
  MusicItem(
      title: "Mediative space",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Mediative.png'),
  MusicItem(
      title: "Moon vibes",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Moonmusic.png'),
  MusicItem(
      title: "Peaceful and calm",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Peaceful.png'),
  MusicItem(
      title: "Tropical",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Tropical.png'),
  MusicItem(
      title: "Winter",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Winter.png')
];
