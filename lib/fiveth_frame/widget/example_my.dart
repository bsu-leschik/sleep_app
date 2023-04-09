import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../data_type.dart';
import '../data_fiveth.dart';
import 'bar_widget.dart';
import 'first_lock.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  /// List of Tab Bar Item

  int current = 0;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141733),

      /// APPBAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF141733),
        title: const BarWidget(),
        // Text(
        //   "Custom TabBar",
        //   style: GoogleFonts.laila(
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ),
      body: Container(
        color: const Color(0xFF141733),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            /// CUSTOM TABBAR
            SizedBox(
              // color: Colors.red,
              // цвет для теста
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  // длинна списка типа музыки
                  itemCount: context.read<DataTypeList>().items.length,
                  // (items.length),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(left: 17),
                            width: 80,
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
                                textAlign: TextAlign.center,
                                //  текст типа музыки
                                context.read<DataTypeList>().items[index],
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
                        ),
                      ],
                    );
                  }),
            ),
            const FirstLock(),
            Divider(
              color: const Color(0xFF8E9FCC),
              thickness: 1,
              indent: screenWidth * 0.11,
              endIndent: screenWidth * 0.11,
            ),

            /// MAIN BODY
            Container(
              padding: EdgeInsets.zero,
              // color: Colors.orange,
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 294,
              child: GridView.builder(
                  itemCount:
                      // secondList.length,
                      context.read<DataTypeList>().secondList.length,
                  // context.read<TypeListMusic>(),
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          context
                                  .read<DataTypeList>()
                                  .secondList[current][index]
                                  .isSelected =
                              !context
                                  .read<DataTypeList>()
                                  .secondList[current][index]
                                  .isSelected;
                        });
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Center(
                                child: InkWell(
                                  // onTap: () {
                                  //   setState(() {
                                  //     widget.activeTap = !widget.activeTap;
                                  //   });
                                  //   print("object12");
                                  // },
                                  child: Container(
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.09,
                                    decoration: BoxDecoration(
                                      color: context
                                              .watch<DataTypeList>()
                                              .secondList[current][index]
                                              .isSelected
                                          ? const Color(0xFF9747FF)
                                          : Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(59),
                                      ),
                                      border: Border.all(
                                        color: const Color(0xFF8E9FCC),
                                        // const Color(0xff8e9fcc),
                                        width: 1,
                                      ),
                                    ),
                                    child:
                                        Image.asset("assets/images/Fire.png"),
                                  ),
                                ),
                              ),
                              Text(
                                context
                                    .read<DataTypeList>()
                                    .secondList[current][index]
                                    .title,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8E9FCC),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: screenWidth * 0.05,
                            child: SizedBox(
                              width: screenWidth * 0.07,
                              height: screenHeight * 0.03,
                              child: const CircleAvatar(
                                backgroundColor: Color(0xFF003293),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Icon(
                                    Icons.lock,
                                    size: 15,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
