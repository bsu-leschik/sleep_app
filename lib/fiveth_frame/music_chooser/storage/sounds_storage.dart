import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/storage.dart';
import 'package:sleep_app/fiveth_frame/music_types_bar/choose_music_bar_model.dart';

import '../items/sound_item.dart';
import '../items/sound_property.dart';

class SoundsStorage extends Storage<SoundItem> {
  List<Map<String, SoundItem>> musicLists = List.generate(
      MusicBarModel.tabs.length, (index) => <String, SoundItem>{});

  static const basicSoundsInfo = "assets/sounds/sounds.json";
  static const int _shift = 2;
  late String soundsInfo;

  SoundsStorage() {
    init();
  }

  int _currentListIndex = 0;

  int get currentListIndex => _currentListIndex;

  void changeTab(int soundType) {
    if (_currentListIndex == soundType) return;
    _currentListIndex = soundType;
    notifyListeners();
  }

  init() async {
    soundsInfo =
        '${(await getApplicationDocumentsDirectory()).path}/sounds.json';
    read();
  }

  @override
  decode(String json) {
    List<dynamic> map = jsonDecode(json);
    for (var element in map) {
      var item = SoundItem.fromJson(element);
      musicLists[0].putIfAbsent(item.title, () => item);
    }
    disperse();
  }

  disperse() {
    for (var element in musicLists[0].values) {
      musicLists[element.type.index + _shift]
          .putIfAbsent(element.title, () => element);
      if (element.property == SoundProperties.favorite) {
        musicLists[1].putIfAbsent(element.title, () => element);
      }
    }
  }

  @override
  read() async {
    String json;
    if (!await File(soundsInfo).exists()) {
      json = await rootBundle.loadString(basicSoundsInfo);
    } else {
      json = await File(soundsInfo).readAsString();
    }
    try {
      decode(json);
    } catch (e) {
      decode(await rootBundle.loadString(basicSoundsInfo));
    }

    notifyListeners();
  }

  @override
  save(AbstractItemState<SoundItem> item) async {
    musicLists[0].update(item.widget.title, (value) {
      return SoundItem(
        type: item.widget.type,
        property: item.currentProperty!,
        title: item.widget.title,
      );
    });

    if (item.currentProperty == SoundProperties.favorite) {
      musicLists[1].putIfAbsent(
          item.widget.title,
          () => SoundItem(
                type: item.widget.type,
                property: item.currentProperty!,
                title: item.widget.title,
              ));
    }

    musicLists[item.widget.type.index + _shift].update(
        item.widget.title,
        (value) => SoundItem(
              type: item.widget.type,
              property: item.currentProperty!,
              title: item.widget.title,
            ));
    var jsonString = jsonEncode(musicLists[0].values.toList());

    log(jsonString);
    var file = await File(soundsInfo).create();
    file.writeAsString(jsonString);
  }
}
