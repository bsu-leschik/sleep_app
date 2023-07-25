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

import '../../timer_picker/provider/timer_provider.dart';
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

  String? get musicPlayingName {
    if (_currentMix.music == null || _currentMix.music?.item.title == null) {
      return null;
    }
    return _currentMix.music?.item.title;
  }

  Mix get mix => _currentMix;
  int get count => ((mix.music == null ? 0 : 1) + mix.sounds.length);

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
      _currentMix.removeSound(sound.title);
    } else {
      player.playSound(sound.title, volume);
      _currentMix.addSound(sound, volume);
    }
    notifyListeners();
    return true;
  }

  bool addMusic(MusicItem music, {double volume = _basicVolume}) {
    if (music.property == SoundProperties.locked) {
      return false;
    }
    if (_currentMix.music?.item.title == music.title) {
      player.stopMusic();
      _currentMix.music = null;
    } else {
      if (_currentMix.music == null) {
        player.playMusic(music.title, volume);
      } else {
        player.stopMusic();
        player.playMusic(music.title, volume);
      }
      _currentMix.addMusic(music, volume);
    }
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

  void pause() {
    player.pause();
    notifyListeners();
  }

  void resume() {
    player.resume();
    notifyListeners();
  }

  /// if [name] is null the action will happen to MusicItem
  void adjustVolume(double volume, {String? name}) {
    if (name == null) {
      adjustMusicVolume(volume);
    } else {
      adjustSoundVolume(name, volume);
    }
  }

  void adjustSoundVolume(String name, double volume) {
    _currentMix.adjustSoundVolume(name, volume);
    player.adjustSoundVolume(name, volume);
    notifyListeners();
  }

  void adjustMusicVolume(double volume) {
    _currentMix.adjustMusicVolume(volume);
    player.adjustMusicVolume(volume);
    notifyListeners();
  }

  /// if [name] is null the action will happen to MusicItem
  double? getVolume({String? name}) {
    if (name == null) {
      return getMusicVolume();
    } else {
      return getSoundVolume(name);
    }
  }

  double? getMusicVolume() {
    return _currentMix.music?.volume;
  }

  double? getSoundVolume(String name) {
    return _currentMix.sounds[name]?.volume;
  }

  void _removeSound(String title) {
    player.stopSound(title);
    _currentMix.removeSound(title);
  }

  void _removeMusic() {
    player.stopMusic();
    _currentMix.removeMusic();
  }

  ///if [title] is null, the action will happen to MusicItem
  void remove({String? title}) {
    if (title == null) {
      _removeMusic();
    } else {
      _removeSound(title);
    }
    notifyListeners();
  }

  MixesStorage update(TimerProvider timer) {
    if (timer.ended) {
      pause();
    }
    return this;
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
