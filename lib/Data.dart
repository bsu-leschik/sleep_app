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

// class DataTypeMusic with ChangeNotifier {
//   int value = 1;
//   static const List<Widget> type = <Widget>[
//     Text("All"),
//     Text("Favorite"),
//     Text("Music"),
//     Text("Nature"),
//     Text("Urban"),
//     Text("Animals"),
//     Text("White noise"),
//     Text("Home"),
//     Text("Baby"),
//     Text("Single"),
//   ];

//   final List<bool> _selectedType = <bool>[
//     true,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//     false,
//   ];
// }
class DataTypeList with ChangeNotifier {
  List<List<String>> allList = [List.filled(8, [])];
  List<String> nature = [
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
  ];
  List<String> favourite = [];
  List<String> music = [];
  List<String> urban = [
    "Crowd",
    "Kids",
    "Subway",
    "Train",
    "Cricket",
    "Live",
    "Phone",
  ];
  List<String> animals = [
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
  ];
  List<String> whiteNoise = [
    "Microwave",
    "Metronome",
  ];
  List<String> home = [
    "Hairdryer",
    "Fan",
    "Teapot",
    "Vacuum Cleaner",
    "Washing Machine",
    "Watch",
    "Lullaby",
    "Music Box",
    "Refrigirator",
  ];
  List<String> baby = [
    "Whisper",
  ];
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
