import 'package:hive_flutter/hive_flutter.dart';

part 'choose_music_bar_model.g.dart';

@HiveType(typeId: 3)
enum SoundType {
  @HiveField(0)
  music("Music"),
  @HiveField(1)
  nature("Nature"),
  @HiveField(2)
  urban("Urban"),
  @HiveField(3)
  animals("Animals"),
  @HiveField(4)
  whiteNoise("White noise"),
  @HiveField(5)
  home("Home"),
  @HiveField(6)
  baby("Baby");

  const SoundType(this.name);

  factory SoundType.byName(String name) {
    switch (name) {
      case "Music":
        return SoundType.music;
      case "Nature":
        return SoundType.nature;
      case "Urban":
        return SoundType.urban;
      case "Animals":
        return SoundType.animals;
      case "White noise":
        return SoundType.whiteNoise;
      case "Home":
        return SoundType.home;
      case "Baby":
        return SoundType.baby;
      default:
        throw ArgumentError("Inacceptable name of SoundType");
    }
  }

  final String name;
}

enum MusicBarElement {
  all("All"),
  favorite("Favorite"),
  music("Music"),
  nature("Nature"),
  urban("Urban"),
  animals("Animals"),
  whiteNoise("White noise"),
  home("Home"),
  baby("Baby");

  final String name;

  const MusicBarElement(this.name);

  factory MusicBarElement.byName(String name) {
    switch (name) {
      case "All":
        return MusicBarElement.all;
      case "Favorite":
        return MusicBarElement.favorite;
      case "Music":
        return MusicBarElement.music;
      case "Nature":
        return MusicBarElement.nature;
      case "Urban":
        return MusicBarElement.nature;
      case "Animals":
        return MusicBarElement.animals;
      case "White noise":
        return MusicBarElement.whiteNoise;
      case "Home":
        return MusicBarElement.home;
      case "Baby":
        return MusicBarElement.baby;
      default:
        throw ArgumentError("Inacceptable name of MusicBarElement");
    }
  }

  /// With all and favourite throws ArgumentError
  SoundType getSoundType() {
    if (this == MusicBarElement.all || this == MusicBarElement.favorite) {
      throw ArgumentError(
          "Inacceptable MusicBarElement for conversion to SounType");
    }
    return SoundType.byName(name);
  }
}

class MusicBarModel {
  static List<String> tabs = [
    "All",
    "Favorite",
    "Music",
    "Nature",
    "Urban",
    "Animals",
    "White noise",
    "Home",
    "Baby"
  ];
}
