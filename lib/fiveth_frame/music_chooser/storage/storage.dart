import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';

abstract class Storage extends ChangeNotifier {
  save(AbstractItemState item) {}
}
