import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/music_item.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/storage.dart';

class MusicStorage extends Storage {
  var PATH_TO_MUSIC = "assets/music/music.json";

  List<MusicItem> items = [];

  MusicStorage() {
    Future<String> json = rootBundle.loadString(PATH_TO_MUSIC);
    json.then((value) {
      List<dynamic> map = jsonDecode(value);
      for (var element in map) {
        var item = MusicItem.fromJson(element);
        items.add(item);
      }
      notifyListeners();
    });
  }
}
