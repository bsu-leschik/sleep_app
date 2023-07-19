import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sleep_app/fiveth_frame/storage/mixes/play_controller.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';
import 'package:sleep_app/fiveth_frame/storage/mixes/mix_music_item.dart';
import 'package:sleep_app/fiveth_frame/storage/mixes/mix_sound_item.dart';
import 'package:sleep_app/fiveth_frame/storage/music_storage/music_item.dart';
import 'package:sleep_app/fiveth_frame/storage/music_storage/music_storage.dart';
import 'package:sleep_app/fiveth_frame/storage/sounds_storage/sounds_list.dart';
import 'package:sleep_app/fiveth_frame/storage/sounds_storage/sounds_storage.dart';

import '../sounds_storage/sound_item.dart';
import 'mix.dart';

part 'mixes_storage.g.dart';

class MixesStorage extends ChangeNotifier {
  final Map<String, Mix> _mixes = <String, Mix>{};
  Mix _currentMix = Mix();
  final String _boxName = "Mixes";
  late Box<_HiveMix> _box;
  static const _basicVolume = 1.0;
  PlayController player = PlayController();

  MixesStorage(MusicStorage musicStorage, SoundsStorage soundsStorage) {
    _init(musicStorage, soundsStorage);
  }

  void _init(MusicStorage musicStorage, SoundsStorage soundsStorage) async {
    Hive.registerAdapter(HiveMixItemAdapter());
    Hive.registerAdapter(HiveMixAdapter());
    _box = await Hive.openBox<_HiveMix>(_boxName);
    var map = _box.toMap().cast<String, _HiveMix>();
    map.forEach(
      (key, value) => _mixes.putIfAbsent(
        key,
        () => Mix(
          name: key,
          music: MixMusicItem(
            item: musicStorage.getItemByName(value.music.title),
            volume: value.music.volume,
          ),
          sounds: List.generate(
            sounds.length,
            (index) => MixSoundItem(
              volume: value.sounds[index].volume,
              item: soundsStorage.getItemByName(value.sounds[index].title),
            ),
          ),
        ),
      ),
    );
    notifyListeners();
  }

  bool addSound(SoundItem sound, {double volume = _basicVolume}) {
    if (sound.property == SoundProperties.locked) {
      return false;
    }
    if (_currentMix.containsSound(sound.title)) {
      player.stopSound(sound.title);
    } else {
      player.playSound(sound.title, volume);
    }
    _currentMix.addSound(sound, volume);
    notifyListeners();
    return true;
  }

  bool addMusic(MusicItem music, {double volume = _basicVolume}) {
    if (music.property == SoundProperties.locked) {
      return false;
    }
    if (_currentMix.music != null && _currentMix.music!.item == music) {
      player.stopMusic();
    } else {
      player.playMusic(music.title, volume);
    }
    _currentMix.addMusic(music, volume);
    notifyListeners();
    return true;
  }

  void saveMix() {
    if (_currentMix.name == null) {
      throw ArgumentError.notNull("Mix name is null");
    }
    _box.put(_currentMix.name, _HiveMix.fromMix(_currentMix));
    _mixes.putIfAbsent(_currentMix.name!, () => _currentMix);
  }

  void clear() {
    _currentMix = Mix();
    player.stop();
    notifyListeners();
  }
}

@HiveType(typeId: 5)
class _HiveMixItem {
  @HiveField(0)
  double volume;
  @HiveField(1)
  String title;

  _HiveMixItem({required this.volume, required this.title});

  _HiveMixItem.fromMusic(MixMusicItem item)
      : volume = item.volume,
        title = item.item.title;

  _HiveMixItem.fromSound(MixSoundItem item)
      : volume = item.volume,
        title = item.item.title;
}

@HiveType(typeId: 6)
class _HiveMix {
  @HiveField(0)
  String name;
  @HiveField(1)
  _HiveMixItem music;
  @HiveField(2)
  List<_HiveMixItem> sounds;

  _HiveMix({required this.name, required this.music, required this.sounds});

  _HiveMix.fromMix(Mix mix)
      : name = mix.name!,
        music = _HiveMixItem.fromMusic(mix.music!),
        sounds = List.generate(
            mix.sounds.length,
            (index) =>
                _HiveMixItem.fromSound(mix.sounds.values.toList()[index]));
}
