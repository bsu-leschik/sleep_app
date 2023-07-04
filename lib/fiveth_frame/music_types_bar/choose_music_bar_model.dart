enum SoundType {
  music("Music"),
  nature("Nature"),
  urban("Urban"),
  animals("Animals"),
  whiteNoise("White noise"),
  home("Home"),
  baby("Baby");

  const SoundType(this.name);

  final String name;
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
