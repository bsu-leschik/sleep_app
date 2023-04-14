import 'package:flutter/material.dart';



class DataSlider extends ChangeNotifier {
  double _rating1 = 1;
  // double get newRating => _rating1;
  void changeRating(double newRating) {
    _rating1 = newRating;
    notifyListeners();
  }
}


class Lists extends ChangeNotifier {}


class MuzModeTwo {
  final String? image;
  final String title;
  final String music;
  bool isSelected;
  MuzModeTwo({
    required this.image,
    required this.title,
    required this.music,
    required this.isSelected,
  });
}


class DataListCurrentWidget extends ChangeNotifier {
  List<String> unlockMusik = [
    
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
