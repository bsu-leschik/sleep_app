import 'package:sleep_app/player/music_chooser/items/sound_property.dart';

import 'music_item.dart';

const String musicFolder = "assets/images/music/";

const Map<String, MusicItem> music = {
  "Mediative space": MusicItem(
      title: "Mediative space",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Mediative.png'),
  "Moon vibes": MusicItem(
      title: "Moon vibes",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Moonmusic.png'),
  "Peaceful and calm": MusicItem(
      title: "Peaceful and calm",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Peaceful.png'),
  "Tropical": MusicItem(
      title: "Tropical",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Tropical.png'),
  "Winter": MusicItem(
      title: "Winter",
      property: SoundProperties.unlocked,
      imageRoute: '${musicFolder}Winter.png')
};
