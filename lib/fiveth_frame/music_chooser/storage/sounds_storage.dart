import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/sounds_list.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/storage.dart';
import 'package:sleep_app/fiveth_frame/music_types_bar/choose_music_bar_model.dart';

import '../items/sound_item.dart';

class SoundsStorage extends Storage<SoundItem> {
  String boxName = "Sounds";
  late Box<SoundItem> box;
  Map<String, SoundItem> _sounds = <String, SoundItem>{};
  List<SoundItem> _currentSounds = <SoundItem>[];
  MusicBarElement _currentElementType = MusicBarElement.all;

  MusicBarElement get currentElementType => _currentElementType;

  List<SoundItem> get currentList => _currentSounds;

  SoundsStorage() {
    _init();
  }

  _init() async {
    await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
    Hive.registerAdapter(SoundItemAdapter());
    Hive.registerAdapter(SoundPropertiesAdapter());
    Hive.registerAdapter(SoundTypeAdapter());
    if (await Hive.boxExists(boxName)) {
      read();
    } else {
      _sounds = sounds;
      _currentSounds = sounds.values.toList();
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

  @override
  read() async {
    box = await Hive.openBox<SoundItem>(boxName);
    _sounds = box.toMap().cast<String, SoundItem>();
    _currentSounds = _sounds.values.toList();
    notifyListeners();
  }

  @override
  save(AbstractItemState<SoundItem> item) async {
    var currrentItem = SoundItem(
        property: item.currentProperty!,
        title: item.widget.title,
        type: item.widget.type);
    box.put(item.widget.title, currrentItem);

    _sounds.update(item.widget.title, (value) => currrentItem);
    _currentSounds = _sounds.values.toList();
    _filter(_currentElementType);
    notifyListeners();
  }
}
