import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/class/data_type_list.dart';

import 'widgets/total_frame.dart';

class CurrentMix extends StatelessWidget {
  const CurrentMix({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitalScreenWidget();
  }
}

class InitalScreenWidget extends StatefulWidget {
  const InitalScreenWidget({super.key});

  @override
  HomeWidget createState() => HomeWidget();
}

class HomeWidget extends State<InitalScreenWidget> {
  final int _counter = 0;
  //context.read<DataTypeList>().activePlayList.length.toInt();

  void _incrementCounter() {
    setState(() {
      int _counter;
    });
  }

  bool play = false;

  final PageController _navPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView(
        controller: _navPage,
        onPageChanged: (i) {
          print('Page changes to index $i');
        },
        children: const <Widget>[
          TotalFrame(),
          // Container(
          //   color: Colors.red,
          // ),
        ],
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF01308C),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //color: Colors.red,
              margin: EdgeInsets.only(
                left: screenWidth * 0.07,
                top: screenHeight * 0.009,
              ),
              width: screenWidth * 0.23,
              height: screenHeight * 0.065,
              child: InkWell(
                onTap: (() {
                  print("Mix");
                  setState(() {
                    context.read<DataTypeList>().activePlayList.length.toInt();
                  });
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //color: Colors.red,
                          width: screenWidth * 0.06,
                          height: screenHeight * 0.03,
                          child: Image.asset(
                            "assets/images/mix.png",
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 23,
                          decoration: const BoxDecoration(
                            color: Color(0xFF7E44FA),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text("$_counter"),
                        ),
                      ],
                    ),
                    const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Mix",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: screenWidth * 0.07,
                top: screenHeight * 0.009,
              ),
              width: screenWidth * 0.23,
              height: screenHeight * 0.07,
              child: InkWell(
                onTap: (() {
                  print("Timer");
                  setState(() {
                    _navPage.jumpToPage(1);
                  });
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.06,
                      height: screenHeight * 0.03,
                      child: const Icon(
                        Icons.timer_sharp,
                        color: Colors.white,
                      ),
                    ),
                    const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Timer",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        // color: Colors.red,
        height: screenHeight * 0.11,
        width: screenWidth * 0.24,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              play = !play;
            });
          },
          child: Icon(
            size: 55,
            play ? Icons.play_arrow_rounded : Icons.pause_rounded,
            color: const Color(0xFF7E44FA),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
