import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../data_type.dart';

class TypeMusic extends StatefulWidget {
  const TypeMusic({super.key});

  @override
  State<TypeMusic> createState() => _TypeMusicState();
}

class _TypeMusicState extends State<TypeMusic> {
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
        itemCount: context.read<DataTypeTopMusic>().length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // final key = context.read<DataTypeMusic>().type.keys.elementAt(index);
          return ToggleButtons(
            onPressed: (int index) {
              setState(() {
                for (int i = 0;
                    i < context.read<DataTypeList>().selectedType.length;
                    i++) {
                  context.read<DataTypeList>().selectedType[i] = i == index;
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
            isSelected: context.read<DataTypeList>().selectedType,
            children: context.read<DataListWidget>().type,
          );
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

// c 15 String 
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