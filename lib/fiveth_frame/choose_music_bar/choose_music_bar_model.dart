enum SoundType {
  any("All"),
  favorite("Favorite"),
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

class SoundTypeModel {
  var current = SoundType.any;
}
