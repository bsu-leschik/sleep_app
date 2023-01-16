import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeMusic extends StatelessWidget {
  const TypeMusic({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    List<String> type = [
      "All",
      "Favorite",
      "Music",
      "Nature",
      "Urban",
      "Animals",
      "White noise",
      "Home",
      "Baby",
      "Single"
    ];
    return SizedBox(
      // color: Colors.amber,
      height: screenHeight * 0.085,
      width: screenWidth * 2.5,
      child: ListView.builder(
        itemCount: type.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CategoryToogle(
            title: type[index],
          );
        },
      ),
    );
  }
}

class CategoryToogle extends StatefulWidget {
  final String title;
  const CategoryToogle({super.key, required this.title});

  @override
  State<CategoryToogle> createState() => _CategoryToogleState();
}

class _CategoryToogleState extends State<CategoryToogle> {
  bool isSelected = false;
  List<bool> shine = [
    false,
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
  void select() {
    setState(() {
      shine[0] = true;
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        select();
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(59),
            border: Border.all(
              color: const Color(0xFF8E9FCC),
            ),
            color:
                isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF141733),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              widget.title,
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
      ),
    );
  }
}
