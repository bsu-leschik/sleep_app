// @author  ninan

import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

//This widget is the main widget.
class BottomBar extends StatelessWidget {
  static const String appTitle = 'Bottom Nav Bar';

  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: InitalScreenWidget(),
    );
  }
}

//Initial widget
class InitalScreenWidget extends StatefulWidget {
  const InitalScreenWidget({super.key});

  // InitialScreenWidget({Key key}) : super(key: key);

  @override
  HomeWidget createState() => HomeWidget();
}

//State<StatefulWidget> action method
class HomeWidget extends State<InitalScreenWidget> {
  // final int _count = 0;
  // final Color _iconPressed = Colors.amber;
  bool play = false;

  //Page controller
  final PageController _navPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF), //white
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: GestureDetector(
                onTap: () {
                  _navPage.jumpToPage(5);
                },
                child: const Icon(
                  Icons.more_vert,
                  size: 26.0,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: PageView(
        controller: _navPage,
        onPageChanged: (int) {
          print('Page changes to index $int');
        },
        children: <Widget>[
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.amber,
          ),
        ],
        // physics: NeverScrollableScrollPhysics(), //to disable Swipe
      ),

      backgroundColor: Colors.transparent, //white ivory
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF01308C),
        shape: const CircularNotchedRectangle(),
        child: Container(
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
                      Container(
                        width: 25,
                        height: 22,
                        color: Colors.amber,
                      ),
                      const Text("Mix"),
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
                    print("Mix");
                    setState(() {
                      _navPage.jumpToPage(1);
                    });
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 25,
                        height: 22,
                        color: Colors.amber,
                      ),
                      const Text("Timer"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 92,
        width: 92,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              play = !play;
            });
          },
          // onPressed: () => setState(() {
          //   _count++;
          //   print('You like Indonesia $_count time(s)');

          // }),
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
} //Toast function
 