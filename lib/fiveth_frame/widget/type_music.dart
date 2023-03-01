import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data.dart';

class TypeMusic extends StatefulWidget {
  const TypeMusic({super.key});

  @override
  State<TypeMusic> createState() => _TypeMusicState();
}

class _TypeMusicState extends State<TypeMusic> {
  // Map<String, bool> type = {
  //   "All": true,
  //   "Favorite": false,
  //   "Music": false,
  //   "Nature": false,
  //   "Urban": false,
  //   "Animals": false,
  //   "White noise": false,
  //   "Home": false,
  //   "Baby": false,
  //   "Single": false,
  // };
  // Map<String, bool> active = {
  //   "All": true,
  //   "Favorite": false,
  //   "Music": false,
  //   "Nature": false,
  //   "Urban": false,
  //   "Animals": false,
  //   "White noise": false,
  //   "Home": false,
  //   "Baby": false,
  //   "Single": false,
  // };
  static const List<Widget> type = <Widget>[
    Text("All"),
    Text("Favorite"),
    Text("Music"),
    Text("Nature"),
    Text("Urban"),
    Text("Animals"),
    Text("White noise"),
    Text("Home"),
    Text("Baby"),
    Text("Single"),
  ];

  final List<bool> _selectedType = <bool>[
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

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    // Map<String, bool> activeType = true
    //     ? context.read<DataTypeMusic>().type
    //     : context.read<DataTypeMusic>().type;
    return SizedBox(
      height: screenHeight * 0.085,
      width: screenWidth * 2.5,
      child: ListView.builder(
        itemCount: type.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // final key = context.read<DataTypeMusic>().type.keys.elementAt(index);
          return
              //  InkWell(
              //   splashColor: Colors.transparent,
              //   onTap: () {
              //     setState(() {
              //       for (int i = 0; i < _selectedType.length; i++) {
              //         _selectedType[i] = i == index;
              //       }
              //     });
              //   },
              //   child: CategoryToogle(
              //       title: type[index].toString(),
              //       isSelected: _selectedType,
              //     ),
              // );// не удалось, ошибка в 94 строке
              ToggleButtons(
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selectedType.length; i++) {
                  _selectedType[i] = i == index;
                }
              });
            },
            renderBorder: false,
            borderRadius: const BorderRadius.all(Radius.circular(59)),
            selectedBorderColor: const Color(0xFFFFFFFF),
            disabledBorderColor: const Color(0xFF8E9FCC),
            selectedColor: const Color(0xFF281343),
            fillColor: const Color(0xFFFFFFFF),
            color: const Color(0xFF8E9FCC),
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedType,
            children: type,
          ); // рабочий код, но цвета настроить
          // InkWell(
          //   splashColor: Colors.transparent,
          //   onTap: () {
          //     context.read<DataTypeMusic>().type.forEach(
          //       (k, v) {
          //         if (k == key) {
          //           activeType[k] = !activeType[k]!;
          //           context.read<DataTypeMusic>().value = 0;
          //         } else {
          //           activeType[k] = false;
          //         }
          //       },
          //     );
          //     setState(() {});
          //   },
          // child: CategoryToogle(
          //   title: key,
          //   isSelected: activeType[key]!,
          //   ),
          // ); тяжёлый к восприятию тоже рабочий
        },
      ),
    );
  }
}

class CategoryToogle extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryToogle({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(59),
          border: Border.all(
            color: const Color(0xFF8E9FCC),
          ),
          color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF141733),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            title
            //  + context.watch<DataTypeList>().value.toString()
            ,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                height: 21.82 / 16,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? const Color(0xFF281343)
                    : const Color(0xFF8E9FCC),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// const List<Widget> fruits = <Widget>[
//   Text('Apple'),
//   Text('Banana'),
//   Text('Orange')
// ];

// const List<Widget> vegetables = <Widget>[
//   Text('Tomatoes'),
//   Text('Potatoes'),
//   Text('Carrots')
// ];

// const List<Widget> icons = <Widget>[
//   Icon(Icons.sunny),
//   Icon(Icons.cloud),
//   Icon(Icons.ac_unit),
// ];

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static const String _title = 'ToggleButtons Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: ToggleButtonsSample(title: _title),
//     );
//   }
// }

// class ToggleButtonsSample extends StatefulWidget {
//   const ToggleButtonsSample({super.key, required this.title});

//   final String title;

//   @override
//   State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
// }

// class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
//   final List<bool> _selectedFruits = <bool>[true, false, false];
//   final List<bool> _selectedVegetables = <bool>[false, true, false];
//   final List<bool> _selectedWeather = <bool>[false, false, true];
//   bool vertical = false;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // ToggleButtons with a single selection.
//               Text('Single-select', style: theme.textTheme.titleSmall),
//               const SizedBox(height: 5),
//               ToggleButtons(
//                 direction: vertical ? Axis.vertical : Axis.horizontal,
//                 onPressed: (int index) {
//                   setState(() {
//                     // The button that is tapped is set to true, and the others to false.
//                     for (int i = 0; i < _selectedFruits.length; i++) {
//                       _selectedFruits[i] = i == index;
//                     }
//                   });
//                 },
//                 borderRadius: const BorderRadius.all(Radius.circular(8)),
//                 selectedBorderColor: Colors.red[700],
//                 selectedColor: Colors.white,
//                 fillColor: Colors.red[200],
//                 color: Colors.red[400],
//                 constraints: const BoxConstraints(
//                   minHeight: 40.0,
//                   minWidth: 80.0,
//                 ),
//                 isSelected: _selectedFruits,
//                 children: fruits,
//               ),
//               const SizedBox(height: 20),
//               // ToggleButtons with a multiple selection.
//               Text('Multi-select', style: theme.textTheme.titleSmall),
//               const SizedBox(height: 5),
//               ToggleButtons(
//                 direction: vertical ? Axis.vertical : Axis.horizontal,
//                 onPressed: (int index) {
//                   // All buttons are selectable.
//                   setState(() {
//                     _selectedVegetables[index] = !_selectedVegetables[index];
//                   });
//                 },
//                 borderRadius: const BorderRadius.all(Radius.circular(8)),
//                 selectedBorderColor: Colors.green[700],
//                 selectedColor: Colors.white,
//                 fillColor: Colors.green[200],
//                 color: Colors.green[400],
//                 constraints: const BoxConstraints(
//                   minHeight: 40.0,
//                   minWidth: 80.0,
//                 ),
//                 isSelected: _selectedVegetables,
//                 children: vegetables,
//               ),
//               const SizedBox(height: 20),
//               // ToggleButtons with icons only.
//               Text('Icon-only', style: theme.textTheme.titleSmall),
//               const SizedBox(height: 5),
//               ToggleButtons(
//                 direction: vertical ? Axis.vertical : Axis.horizontal,
//                 onPressed: (int index) {
//                   setState(() {
//                     // The button that is tapped is set to true, and the others to false.
//                     for (int i = 0; i < _selectedWeather.length; i++) {
//                       _selectedWeather[i] = i == index;
//                     }
//                   });
//                 },
//                 borderRadius: const BorderRadius.all(Radius.circular(8)),
//                 selectedBorderColor: Colors.blue[700],
//                 selectedColor: Colors.white,
//                 fillColor: Colors.blue[200],
//                 color: Colors.blue[400],
//                 isSelected: _selectedWeather,
//                 children: icons,
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           setState(() {
//             // When the button is pressed, ToggleButtons direction is changed.
//             vertical = !vertical;
//           });
//         },
//         icon: const Icon(Icons.screen_rotation_outlined),
//         label: Text(vertical ? 'Horizontal' : 'Vertical'),
//       ),
//     );
//   }
// }
