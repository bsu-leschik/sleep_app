import 'package:flutter/material.dart';

import '../../melody_widget/fiveframewidget.dart';

class BottomBar extends StatelessWidget {
  static const String appTitle = 'Bottom Nav Bar';

  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: InitalScreenWidget(),
    );
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
    return Scaffold(
      body: PageView(
        controller: _navPage,
        onPageChanged: (i) {
          print('Page changes to index $i');
        },
        children: <Widget>[
          const MelodyWidget(),
          Container(
            color: Colors.black12,
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF01308C),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 29.0, top: 8),
                width: 88,
                height: 55,
                child: InkWell(
                  onTap: (() {
                    print("Mix");
                    setState(() {
                      _navPage.jumpToPage(0);
                    });
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 25,
                        height: 22,
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
                width: 88,
                height: 55,
                child: InkWell(
                  onTap: (() {
                    print("Timer");
                    setState(() {
                      _navPage.jumpToPage(1);
                    });
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SizedBox(
                        width: 25,
                        height: 22,
                        child: Icon(
                          Icons.timer_sharp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
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
        height: 92,
        width: 92,
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
