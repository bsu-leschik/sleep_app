import 'package:flutter/material.dart';

int checkedIndex = 0;

List cardNames = [
  'Sports',
  'Wild Life',
  'Night',
  'LandSpace',
];

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cardNames.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCard(index);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    ),
  );
}

Widget buildCard(int index) {
  bool checked = index == checkedIndex;
  String name = cardNames[index];
  return GestureDetector(
    onTap: () {
      checkedIndex = index;
    },
    child: Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: checked ? Colors.orange : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(name)),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Offstage(
            offstage: !checked,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.check,
                color: Color.fromARGB(255, 71, 96, 72),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
