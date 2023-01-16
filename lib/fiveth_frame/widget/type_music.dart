import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeMusic extends StatefulWidget {
  const TypeMusic({super.key});

  @override
  State<TypeMusic> createState() => _TypeMusicState();
}

class _TypeMusicState extends State<TypeMusic> {
  Map<String, bool> type = {
    "All": false,
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

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight * 0.085,
      width: screenWidth * 2.5,
      child: ListView.builder(
        itemCount: type.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final key = type.keys.elementAt(index);
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              type.forEach(
                (k, v) {
                  if (k == key) {
                    type[k] = !type[k]!;
                  } else {
                    type[k] = false;
                  }
                },
              );
              setState(() {});
            },
            child: CategoryToogle(
              title: key,
              isSelected: type[key]!,
            ),
          );
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
            title,
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