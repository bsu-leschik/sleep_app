import 'package:hive/hive.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/music_item.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/music_list.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/storage.dart';

class MusicStorage extends Storage<MusicItem> {
  final String _boxName = "Music";
  List<MusicItem> _music = music;
  late Box<MusicItem> box;

  MusicStorage() {
    _init();
  }

  List<MusicItem> get musicList => _music;

  _init() async {
    Hive.registerAdapter(MusicItemAdapter());
    if (await Hive.boxExists(_boxName)) {
      read();
    } else {
      box = await Hive.openBox<MusicItem>(_boxName);
      for (var element in music) {
        box.put(element.title, element);
      }
    }
  }

  @override
  read() async {
    box = await Hive.openBox<MusicItem>(_boxName);
    _music = box.values.toList();
    notifyListeners();
  }

  @override
  save(AbstractItemState<MusicItem> item) async {
    notifyListeners();
  }
}
