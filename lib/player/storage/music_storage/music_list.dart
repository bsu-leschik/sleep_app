import 'package:sleep_app/player/music_chooser/items/sound_property.dart';

import 'music_item.dart';

const String musicFolder = "assets/images/music/";

const Map<String, MusicItem> music = {
  "Mediative space": MusicItem(
    title: "Mediative space",
    property: SoundProperties.unlocked,
    imageRoute: '${musicFolder}Mediative.png',
    info: 'https://freesound.org/people/Karma-Ron/sounds/238623/',
  ),
  "Moon vibes": MusicItem(
    title: "Moon vibes",
    property: SoundProperties.locked,
    imageRoute: '${musicFolder}Moonmusic.png',
    info: 'https://freesound.org/people/X3nus/sounds/511703/',
  ),
  "Peaceful and calm": MusicItem(
    title: "Peaceful and calm",
    property: SoundProperties.unlocked,
    imageRoute: '${musicFolder}Peaceful.png',
    info: '',
  ),
  "Tropical": MusicItem(
    title: "Tropical",
    property: SoundProperties.unlocked,
    imageRoute: '${musicFolder}Tropical.png',
    info: '',
  ),
  "Winter": MusicItem(
    title: "Winter",
    property: SoundProperties.unlocked,
    imageRoute: '${musicFolder}Winter.png',
    info: '',
  )
};
