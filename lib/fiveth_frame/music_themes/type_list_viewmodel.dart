import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/elements/music_item.dart';

import '../widget/sound_property.dart';

class TypeListViewModel extends ChangeNotifier {
  void tryPlayMusic(MusicItem music) {
    if (music.soundProperty.property == SoundProperties.locked) {
      //view shows some kind of unlock screen
    } else {}
  }
}
