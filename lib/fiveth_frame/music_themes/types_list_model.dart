import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sleep_app/fiveth_frame/elements/music_item.dart';

class TypesListModel extends ChangeNotifier {
  var PATH_TO_MUSIC = "assets/music/music.json";

  List<MusicItem> items = [];

  TypesListModel() {
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
