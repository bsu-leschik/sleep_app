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
  int current = 0;
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
        itemCount: context.read<DataTypeList>().items.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // final key = context.read<DataTypeMusic>().type.keys.elementAt(index);
          return GestureDetector(
            onTap: () {
              setState(() {
                current = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(left: 17),
              // width: 80,
              height: 45,
              decoration: BoxDecoration(
                color: current == index
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF141733),
                borderRadius: BorderRadius.circular(59),
                border: Border.all(
                  color: const Color(0xFF8E9FCC),
                ),
              ),
              child: Center(
                child: Text(
                  //  текст типа музыки
                  context.read<DataTypeList>().items[index],
                  // items[index],
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      height: 21.82 / 16,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: current == index
                          ? const Color(0xFF281343)
                          : const Color(0xFF8E9FCC),
                    ),
                  ),
                ),
              ),
            ),
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
