import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataSlider with ChangeNotifier {
  double _rating1 = 1;
  // double get newRating => _rating1;
  void changeRating(double newRating) {
    _rating1 = newRating;
    notifyListeners();
  }
}

class DataTypeMusic with ChangeNotifier {
  int value = 1;
  Map<String, bool> type = {
    "All": true,
    "Favorite": false,
    "Music": false,
    "Nature": false,
    "Urban": false,
    "Animals": false,
    "White noise": false,
    "Home": false,
    "Baby": false,
    "Single": false,
  };
  Map get getMap => type;
  void changeType(newType) {
    type = newType;
    notifyListeners();
  }
}

class DataLock with ChangeNotifier {
  int value = 2;
  List<String> ccc = [
    "ALL",
    "Favorite",
    "Music",
    "Nature",
    "Urban",
    "Animals",
    "White noise",
    "Home",
    "Baby",
    "Single",
  ];
  List get getList => ccc;
  void changeCcc(newCcc) {
    ccc = newCcc;
    notifyListeners();
  }
}
