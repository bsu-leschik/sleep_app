import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sleep_app/fiveth_frame/choose_music_bar/choose_music_bar_model.dart';

import '../elements/sound_item.dart';
import '../widget/sound_property.dart';

class SoundsStorageService extends ChangeNotifier {
  static final List<List<SoundItem>> _musicLists = List.filled(
      MusicBarModel.tabs.length, List<SoundItem>.empty(growable: true));

  List<SoundItem> get currentList => _musicLists[_currentListIndex];

  static const PATH_TO_MUSIC = "assets/music/info.json";

  SoundsStorageService() {
    Future<String> json = rootBundle.loadString(PATH_TO_MUSIC);
    json.then((value) {
      List<dynamic> map = jsonDecode(value);
      for (var element in map) {
        var item = SoundItem.fromJson(element);
        int index = item.type.index > 0 ? item.type.index + 1 : item.type.index;
        _musicLists[index].add(item);
        if (item.property == SoundProperties.favorite) {
          _musicLists[1].add(item);
        }
        _musicLists[0].add(item);
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

  static List<SoundItem> list = <SoundItem>[
    SoundItem(
      property: SoundProperties.locked,
      title: "Rain",
      type: SoundType.animals,
    ),
    SoundItem(
      property: SoundProperties.locked,
      title: "Fire",
      type: SoundType.animals,
    ),
    SoundItem(
      property: SoundProperties.locked,
      title: "Forest",
      type: SoundType.animals,
    ),
    SoundItem(
      property: SoundProperties.locked,
      type: SoundType.animals,
      title: "Night",
    ),
    SoundItem(
      title: "Ocean",
      type: SoundType.animals,
      property: SoundProperties.locked,
    ),
    SoundItem(
      title: "River",
      type: SoundType.animals,
      property: SoundProperties.locked,
    ),
    SoundItem(
      title: "Sea",
      type: SoundType.animals,
      property: SoundProperties.locked,
    ),
    SoundItem(
      title: "Thunder",
      type: SoundType.animals,
      property: SoundProperties.locked,
    ),
    SoundItem(
      title: "Snow",
      type: SoundType.animals,
      property: SoundProperties.locked,
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Waterfall",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Crowd",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Kids",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Subway",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Train",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Cricket",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Live",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Phone",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Seagulls",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Cat",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Cows",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Dog",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Dolphins",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Frogs",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Horse",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Owl",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Wolf",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Whale",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Microwave",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Metronome",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Hairdryer",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Fan",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Teapot",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Vacuum Cleaner",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Washing Machine",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Watch",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Lullaby",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Music Box",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Refrigirator",
    ),
    SoundItem(
      type: SoundType.animals,
      property: SoundProperties.locked,
      title: "Whisper",
    ),
  ];
}
