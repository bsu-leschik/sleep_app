import 'package:flutter/material.dart';

class DataSlider extends ChangeNotifier {
  double _rating1 = 1;
  // double get newRating => _rating1;
  void changeRating(double newRating) {
    _rating1 = newRating;
    notifyListeners();
  }
}

class DataTypeList extends ChangeNotifier {
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
      "Crowd",
      "Kids",
      "Subway",
      "Train",
      "Cricket",
      "Live",
      "Phone",
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
      "Microwave",
      "Metronome",
      "Hairdryer",
      "Fan",
      "Teapot",
      "Vacuum Cleaner",
      "Washing Machine",
      "Watch",
      "Lullaby",
      "Music Box",
      "Refrigirator"
          "Whisper",
    ],
    [],
    [],
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
    [],
  ];
  List<String> items = [
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

  int current = 0;
}

class DataListWidget extends ChangeNotifier {
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

class DataTypeTopMusic extends ChangeNotifier {
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

class TabBarTypeMusic extends ChangeNotifier {
  List<Widget> tabBar = <Widget>[
    const Tab(
      text: "All",
    ),
    const Tab(
      text: "Favorite",
    ),
    const Tab(
      text: "Music",
    ),
    const Tab(
      text: ("Nature"),
    ),
    const Tab(
      text: "Urban",
    ),
    const Tab(
      text: "Animals",
    ),
    const Tab(
      text: "White noise",
    ),
    const Tab(
      text: "Home",
    ),
    const Tab(
      text: "Baby",
    ),
    const Tab(
      text: "Single",
    ),
  ];
  List<Widget> scafbar = <Widget>[
    const Center(
      child: Text("It's cloudy here"),
    ),
    const Center(
      child: Text("It's rainy here"),
    ),
    const Center(
      child: Text("It's sunny here"),
    ),
    const Center(
      child: Text("It's cloudy -="),
    ),
    const Center(
      child: Text("It's cloudy +"),
    ),
    const Center(
      child: Text("It's cloudy -"),
    ),
    const Center(
      child: Text("It's cloudy 123"),
    ),
    const Center(
      child: Text("It's cloudy 345"),
    ),
    const Center(
      child: Text("It's cloudy 345"),
    ),
    const Center(
      child: Text("It's cloudy 456"),
    ),
  ];
}
