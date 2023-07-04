import 'package:flutter/material.dart';
import 'widgets/finish_scroll.dart';

class FiveFrameScroll extends StatelessWidget {
  static const String appTitle = 'Bottom Nav Bar';

  const FiveFrameScroll({super.key});

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
          debugPrint('Page changes to index $i');
        },
        children: const <Widget>[
          FinishScroll(),
          // Container(
          //   color: Colors.red,
          // ),
        ],
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF01308C),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: screenHeight * 0.07,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    left: screenWidth * 0.07, top: screenHeight * 0.009),
                width: screenWidth * 0.23,
                height: screenHeight * 0.065,
                child: InkWell(
                  onTap: (() {
                    debugPrint("Mix");
                    setState(() {
                      _navPage.jumpToPage(0);
                    });
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.06,
                        height: screenHeight * 0.03,
                        child: Image.asset(
                          "assets/images/mix.png",
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Mix",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 29.0, top: 8),
                width: screenWidth * 0.23,
                height: screenHeight * 0.07,
                child: InkWell(
                  onTap: (() {
                    debugPrint("Timer");
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
                      const Text(
                        "Timer",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
