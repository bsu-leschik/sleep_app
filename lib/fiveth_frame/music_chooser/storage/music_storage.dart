import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/music_item.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/storage.dart';

class MusicStorage extends Storage<MusicItem> {
  static const basicMusicInfo = "assets/music/music.json";
  late String pathToMusic;
  late Directory musicInfo;
  List<MusicItem> items = [];

  MusicStorage() {
    init();
  }

  init() async {
    musicInfo = await getApplicationDocumentsDirectory();
    pathToMusic = '${musicInfo.path}/music.json';
    read();
  }

  @override
  decode(String json) {
    List<dynamic> map = jsonDecode(json);
    for (var element in map) {
      var item = MusicItem.fromJson(element);
      items.add(item);
    }
  }

  @override
  read() async {
    String json;
    if (!await File(pathToMusic).exists()) {
      json = await rootBundle.loadString(basicMusicInfo);
    } else {
      json = await File(pathToMusic).readAsString();
    }

    try {
      decode(json);
    } catch (e) {
      json = await rootBundle.loadString(basicMusicInfo);
      decode(json);
    }
    notifyListeners();
  }

  @override
  save(AbstractItemState<MusicItem> item) async {
    for (var i = 0; i < items.length; i++) {
      if (item.widget == items[i]) {
        items[i] = MusicItem(
          imageRoute: item.widget.imageRoute,
          property: item.currentProperty!,
          title: item.widget.title,
        );
      }
    }
    var jsonString = jsonEncode(items);

    log(jsonString);
    var file = await File(pathToMusic).create();
    file.writeAsString(jsonString);
  }
}
