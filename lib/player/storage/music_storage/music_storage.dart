import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:sleep_app/player/storage/music_storage/music_list.dart';

import '../../music_chooser/items/sound_property.dart';
import 'music_item.dart';

class MusicStorage extends ChangeNotifier {
  final String _boxName = "Music";
  Map<String, MusicItem> _music = music;
  late Box<MusicItem> box;

  MusicStorage() {
    _init();
  }

  List<MusicItem> get musicList => _music.values.toList();

  _init() async {
    Hive.registerAdapter(MusicItemAdapter());
    if (await Hive.boxExists(_boxName)) {
      read();
    } else {
      box = await Hive.openBox<MusicItem>(_boxName);
      box.putAll(music);
    }
  }

  read() async {
    box = await Hive.openBox<MusicItem>(_boxName);
    _music = box.toMap().cast<String, MusicItem>();
    notifyListeners();
  }

  save(String title, SoundProperties property) async {
    if (!_music.containsKey(title)) {
      throw ArgumentError("No key such key was found");
    }
    var currentItem = MusicItem(
        title: title,
        property: property,
        imageRoute: _music[title]!.imageRoute);
    _music.update(title, (item) => currentItem);
    box.put(title, currentItem);
    notifyListeners();
  }

  favoriteOrPremium(String name) {
    var sound = _music[name];
    if (sound!.property == SoundProperties.locked) {
    } else {
      if (sound.property == SoundProperties.favorite) {
        save(name, SoundProperties.unlocked);
      } else {
        save(name, SoundProperties.favorite);
      }
    }
  }

  SoundProperties getSoundProperty(String name) {
    return _music[name]!.property;
  }

  getItemByName(String name) {
    return _music[name];
  }
}
