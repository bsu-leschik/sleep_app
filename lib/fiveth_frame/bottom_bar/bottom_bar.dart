import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sleep_app/fiveth_frame/bottom_bar/play_button.dart';
import 'package:sleep_app/timer_picker/time_picker.dart';

import '../main_page.dart';
import 'bottom_nav_button.dart';

class BottomBar extends StatelessWidget {
  static const String appTitle = 'Bottom Nav Bar';

  const BottomBar({super.key});

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
  final PageController _navPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _navPage,
        onPageChanged: (i) {
          debugPrint('Page changes to index $i');
        },
        children: const <Widget>[
          MainHome(),
        ],
      ),
      backgroundColor: const Color.fromRGBO(20, 23, 51, 1),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF01308C),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BottomNavButton(
                      labelText: "Mix",
                      icon: CupertinoIcons.shuffle_medium,
                      onTap: () => context.push('/currentMix')),
                ],
              ),
            ),
            Expanded(
                child: Container(
              height: 0,
            )),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BottomNavButton(
                      labelText: "Timer",
                      icon: Icons.timer_outlined,
                      onTap: () => Navigator.push(context, TimerRoute())),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const MainPlayButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
