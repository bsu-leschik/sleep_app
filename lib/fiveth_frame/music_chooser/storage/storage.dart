import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';

abstract class Storage<T extends StatefulWidget> extends ChangeNotifier {
  read();
  decode(String json);
  save(AbstractItemState<T> item);
}
