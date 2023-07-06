import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/sound_list.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/storage.dart';
import 'package:sleep_app/fiveth_frame/music_types_bar/choose_music_bar_model.dart';

import '../items/sound_item.dart';

class SoundsStorage extends Storage<SoundItem> {
  String boxName = "Sounds";
  late Box<SoundItem> box;
  late List<SoundItem> _sounds;
  late List<SoundItem> _currentSounds;
  late Map<String, SoundItem> musicLists = <String, SoundItem>{};

  SoundsStorage() {
    init();
  }

  List<SoundItem> get currentList => _currentSounds;

  void changeTab(int soundType) {
    notifyListeners();
  }

  init() async {
    await Hive.initFlutter(
        '${(await getApplicationDocumentsDirectory()).path}/sounds.json');
    if (await Hive.boxExists(boxName)) {
      read();
    } else {
      box = await Hive.openBox<SoundItem>(boxName);
      box.addAll(sounds);
    }
  }

  @override
  read() async {
    box = await Hive.openBox<SoundItem>(boxName);
    _sounds = box.values.toList();
    _currentSounds = _sounds;
    notifyListeners();
  }

  @override
  save(AbstractItemState<SoundItem> item) async {
    notifyListeners();
  }
}
