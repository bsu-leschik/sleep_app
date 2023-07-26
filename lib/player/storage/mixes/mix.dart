import 'package:sleep_app/player/storage/music_storage/music_item.dart';
import 'package:sleep_app/player/storage/sounds_storage/sound_item.dart';

import 'mix_music_item.dart';
import 'mix_sound_item.dart';

class Mix {
  String? name;
  MixMusicItem? music;
  Map<String, MixSoundItem> sounds = <String, MixSoundItem>{};

  Mix({this.name, this.music, List<MixSoundItem>? sounds}) {
    if (sounds != null) {
      this.sounds = {for (var element in sounds) element.item.title: element};
    }
  }

  void addMusic(MusicItem item, double soundLevel) {
    music = MixMusicItem(volume: soundLevel, item: item);
  }

  /// returns true if no such sound was saved and false when it was already saved
  void addSound(SoundItem item, double volume) {
    sounds.putIfAbsent(
        item.title, () => MixSoundItem(volume: volume, item: item));
  }

  void removeMusic() {
    music = null;
  }

  void removeSound(String soundName) {
    sounds.remove(soundName);
  }

  void adjustSoundVolume(String soundName, double volume) {
    sounds[soundName]!.volume = volume;
  }

  void adjustMusicVolume(double volume) {
    music!.volume = volume;
  }

  bool containsSound(String soundName) => sounds.containsKey(soundName);
}
