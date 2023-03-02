import 'package:flutter/material.dart';

class DataSlider with ChangeNotifier {
  double _rating1 = 1;
  // double get newRating => _rating1;
  void changeRating(double newRating) {
    _rating1 = newRating;
    notifyListeners();
  }
}

class DataTypeList with ChangeNotifier {
  List<List<String>> allList = [
    [
      "Rain",
      "Fire",
      "Forest",
      "Night",
      "Ocean",
      "River",
      "Sea",
      "Thunder",
      "Snow",
      "Waterfall",
    ],
    [],
    [],
    [
      "Crowd",
      "Kids",
      "Subway",
      "Train",
      "Cricket",
      "Live",
      "Phone",
    ],
    [
      "Seagulls",
      "Cat",
      "Cows",
      "Dog",
      "Dolphins",
      "Frogs",
      "Horse",
      "Owl",
      "Wolf",
      "Whale",
    ],
    [
      "Microwave",
      "Metronome",
    ],
    [
      "Hairdryer",
      "Fan",
      "Teapot",
      "Vacuum Cleaner",
      "Washing Machine",
      "Watch",
      "Lullaby",
      "Music Box",
      "Refrigirator",
    ],
    [
      "Whisper",
    ],
  ];

  final List<bool> selectedType = <bool>[
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
}

class DataListWidget with ChangeNotifier {
  List<Widget> type = <Widget>[
    const Text("All"),
    const Text("Favorite"),
    const Text("Music"),
    const Text("Nature"),
    const Text("Urban"),
    const Text("Animals"),
    const Text("White noise"),
    const Text("Home"),
    const Text("Baby"),
    const Text("Single"),
  ];

  final List<bool> selectedType = <bool>[
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
}

class DataTypeTopMusic with ChangeNotifier {
  static const List<String> topType = <String>[
    "All",
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

  get length => topType.length;
}
