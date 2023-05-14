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
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF141733),
        title: const BarWidget(),
      ),
      body: Container(
        color: const Color(0xFF141733),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            /// CUSTOM TABBAR
            SizedBox(
              // color: Colors.red, цвет для теста
              width: double.infinity,
              height: 72,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  // длинна списка типа музыки
                  itemCount: context.read<DataTypeList>().items.length,
                  // (items.length),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(left: 17),
                          width: 80,
                          height: 42,
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
            Positioned(
              top: 30,
              bottom: 0,
              right: 0,
              left: 0,
              child: Stack(children: [
                Container(
                  //margin: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: 200,
                  child: GridView.builder(
                      itemCount: secondList.length,
                      // context.read<DataTypeList>().allList[current].length,
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              context
                                      .read<DataTypeList>()
                                      .secondList[index]
                                      .isSelected =
                                  !context
                                      .read<DataTypeList>()
                                      .secondList[index]
                                      .isSelected;
                              debugPrint("object 111");
                              debugPrint(context
                                  .read<DataTypeList>()
                                  .secondList[index]
                                  .isSelected
                                  .toString());
                            });
                          },
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: InkWell(
                                      child: Container(
                                        width: 78,
                                        height: 78,
                                        decoration: BoxDecoration(
                                          color: context
                                                  .watch<DataTypeList>()
                                                  .secondList[index]
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
                                        child: Image.asset(
                                            "assets/images/Fire.png"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    context
                                        .read<DataTypeList>()
                                        .secondList[index]
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
                                child: const LockIcon(),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: screenWidth,
                      height: 117,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(20, 23, 51, 1),
                              Color.fromRGBO(20, 23, 51, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class LockIcon extends StatelessWidget {
  const LockIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 27,
      height: 27,
      child: CircleAvatar(
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
    );
  }
}
