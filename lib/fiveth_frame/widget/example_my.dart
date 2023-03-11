import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/widget/second_lock.dart';

import '../../data_type.dart';
import 'bar_widget.dart';
import 'first_lock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataTypeList>(
          create: (context) => DataTypeList(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainHome(),
      ),
    );
  }
}

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
            Container(
              color: Colors.red,
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
              color: Colors.orange,
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 260,
              child: GridView.builder(
                  itemCount:
                      // длинна всего списка с (current) счётчиком
                      context.read<DataTypeList>().allList[current].length,
                  // allList[current].length,
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GridSecond(
                        //наименование списка музки по счётчику
                        title: context.read<DataTypeList>().allList[current]
                            [index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
