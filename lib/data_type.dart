import 'package:flutter/material.dart';

class DataSlider extends ChangeNotifier {
  double _rating1 = 1;
  // double get newRating => _rating1;
  void changeRating(double newRating) {
    _rating1 = newRating;
    notifyListeners();
  }
}

// class TimePicker extends ChangeNotifier {
//   Duration duration = const Duration(hours: 1, minutes: 23);
//   void _showDialog(Widget child) {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) => Container(
//         height: 216,
//         padding: const EdgeInsets.only(top: 20),
//         margin: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         color: CupertinoColors.systemBackground.resolveFrom(context),
//       ),
//     );
//   }
// }
class Lists extends ChangeNotifier {}

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
      "Refrigirator",
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
}

class DataListCurrentWidget extends ChangeNotifier {
  List<String> unlockMusik = [
    "Shopen",
    "Lirique",
    "Styucaman",
    "Pop",
    "Drop",
    "Hip-Hop",
    "Rock",
    "I TD",
    "Serduchka",
    "For Baby"
  ];
}
