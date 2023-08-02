import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sleep_app/player/music_chooser/items/sound_property.dart';
import 'package:sleep_app/player/storage/sounds_storage/sound_item.dart';
import 'package:sleep_app/player/storage/sounds_storage/sounds_list.dart';
import 'package:sleep_app/player/music_chooser/music_types_bar/choose_music_bar_model.dart';

class SoundsStorage extends ChangeNotifier {
  String boxName = "Sounds";
  late Box<SoundItem> box;
  Map<String, SoundItem> _sounds = Map<String, SoundItem>.of(sounds);
  List<SoundItem> _currentSounds = sounds.values.toList();
  MusicBarElement _currentElementType = MusicBarElement.all;

  MusicBarElement get currentElementType => _currentElementType;

  List<SoundItem> get currentList => _currentSounds;

  SoundsStorage() {
    _init();
  }

  _init() async {
    //Hive.registerAdapter(SoundItemAdapter());
    Hive.registerAdapter(SoundPropertiesAdapter());
    Hive.registerAdapter(SoundTypeAdapter());
    if (await Hive.boxExists(boxName)) {
      read();
    } else {
      box = await Hive.openBox<SoundItem>(boxName);
      box.putAll(sounds);
    }
  }

  void _filterByType(SoundType type) {
    _currentSounds.removeWhere((value) => value.type != type);
  }

  void _filter(MusicBarElement soundType) {
    switch (soundType) {
      case MusicBarElement.all:
        break;
      case MusicBarElement.favorite:
        _currentSounds
            .removeWhere((value) => value.property != SoundProperties.favorite);
        break;
      default:
        _filterByType(soundType.getSoundType());
        break;
    }
  }

  void changeTab(MusicBarElement soundType) {
    if (_currentElementType == soundType) {
      return;
    }
    _currentSounds = _sounds.values.toList();
    _filter(soundType);
    _currentElementType = soundType;
    notifyListeners();
  }

  read() async {
    box = await Hive.openBox<SoundItem>(boxName);
    _sounds = box.toMap().cast<String, SoundItem>();
    _currentSounds = _sounds.values.toList();
    notifyListeners();
  }

  save(String name, SoundProperties property) async {
    if (!_sounds.containsKey(name)) {
      throw ArgumentError("No key such key was found");
    }
    var currrentItem = SoundItem(
        property: property,
        title: name,
        type: _sounds[name]!.type,
        info: _sounds[name]!.info);
    box.put(name, currrentItem);

    _sounds.update(name, (value) => currrentItem);
    _currentSounds = _sounds.values.toList();
    _filter(_currentElementType);
    notifyListeners();
  }

  SoundProperties getSoundProperty(String name) {
    return _sounds[name]!.property;
  }

  favoriteOrPremium(String name) {
    var sound = _sounds[name];
    if (sound!.property == SoundProperties.locked) {
    } else {
      if (sound.property == SoundProperties.favorite) {
        save(name, SoundProperties.unlocked);
      } else {
        save(name, SoundProperties.favorite);
      }
    }
  }

  getItemByName(String name) {
    return _sounds[name];
  }
}
