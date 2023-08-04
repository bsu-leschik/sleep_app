import 'package:flutter/material.dart';

import '../../../storage/mixes/mixes_storage.dart';

class MixPlaying extends ChangeNotifier {
  String? _mixPlaying;

  String? get mixTitle => _mixPlaying;

  MixPlaying(MixesStorage storage) {
    _mixPlaying = storage.mix.name;
  }

  void update(MixesStorage storage) {
    if (storage.mix.name != _mixPlaying) {
      _mixPlaying = storage.mix.name;
      notifyListeners();
    }
  }
}
