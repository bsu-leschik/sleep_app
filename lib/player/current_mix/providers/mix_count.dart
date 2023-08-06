import 'package:flutter/material.dart';

import '../../storage/mixes/mixes_storage.dart';

class MixCount extends ChangeNotifier {
  int _amount;

  MixCount(MixesStorage storage) : _amount = storage.mixes.length;

  void update(MixesStorage storage) {
    if (storage.mixes.length != _amount) {
      _amount = storage.mixes.length;
      notifyListeners();
    }
  }

  bool get hasMixes => _amount != 0;
}
