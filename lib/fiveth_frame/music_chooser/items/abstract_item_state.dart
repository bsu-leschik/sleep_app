import 'package:flutter/widgets.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';

abstract class AbstractItemState<T extends StatefulWidget> extends State<T> {
  SoundProperties? currentProperty;

  @protected
  callback(BuildContext context) {
    if (currentProperty == SoundProperties.locked) {
      // TODO: add premium window, or ad
      return;
    }
    setState(() {
      if (currentProperty == SoundProperties.favorite) {
        currentProperty = SoundProperties.unlocked;
      } else {
        currentProperty = SoundProperties.favorite;
      }
    });
  }
}
