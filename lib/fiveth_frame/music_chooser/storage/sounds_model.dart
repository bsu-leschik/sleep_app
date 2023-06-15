import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sleep_app/fiveth_frame/music_types_bar/choose_music_bar_model.dart';

import '../items/sound_item.dart';
import '../items/sound_property.dart';

class SoundsStorageService extends ChangeNotifier {
  List<List<SoundItem>> musicLists =
      List.generate(MusicBarModel.tabs.length, (index) => []);

  static const PATH_TO_SOUNDS = "assets/sounds/sounds.json";

  SoundsStorageService() {
    Future<String> json = rootBundle.loadString(PATH_TO_SOUNDS);
    json.then((value) {
      List<dynamic> map = jsonDecode(value);
      for (var element in map) {
        var item = SoundItem.fromJson(element);
        musicLists.elementAt(item.type.index + 2).add(item);
        if (item.property == SoundProperties.favorite) {
          musicLists[1].add(item);
        }
        musicLists[0].add(item);
      }
      notifyListeners();
    });
  }

  int _currentListIndex = 0;

  int get currentListIndex => _currentListIndex;

  void changeTab(int soundType) {
    _currentListIndex = soundType;
    notifyListeners();
  }
}
