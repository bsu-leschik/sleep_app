import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';

import '../items/music_item.dart';

String musicFolder = "assets/images/music/";

List<MusicItem> music = [
  MusicItem(
      title: "Mediative space",
      property: SoundProperties.locked,
      imageRoute: '${musicFolder}Mediative.png'),
  MusicItem(
      title: "Moon vibes",
      property: SoundProperties.locked,
      imageRoute: '${musicFolder}Mediative.png'),
  MusicItem(
      title: "Peaceful and calm",
      property: SoundProperties.locked,
      imageRoute: '${musicFolder}Mediative.png'),
  MusicItem(
      title: "Tropical",
      property: SoundProperties.locked,
      imageRoute: '${musicFolder}Mediative.png'),
  MusicItem(
      title: "Winter",
      property: SoundProperties.locked,
      imageRoute: '${musicFolder}Mediative.png')
];
