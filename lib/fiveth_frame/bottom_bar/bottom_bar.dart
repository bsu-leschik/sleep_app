import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/play_controller.dart';
import 'package:sleep_app/timer_picker/time_picker.dart';

import '../main_page.dart';

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
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            if (Provider.of<PlayController>(context, listen: false).isPlaying) {
              Provider.of<PlayController>(context, listen: false).pause();
            } else {
              Provider.of<PlayController>(context, listen: false).resume();
            }
          },
          child: Icon(
            size: 55,
            Provider.of<PlayController>(context).isPlaying
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            color: const Color(0xFF7E44FA),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BottomNavButton extends StatelessWidget {
  final Text label;
  final Icon icon;
  final Function onTap;

  BottomNavButton(
      {required String labelText,
      required IconData icon,
      required this.onTap,
      super.key})
      : label = Text(labelText,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            )),
        icon = Icon(
          icon,
          color: Colors.white,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        margin: const EdgeInsets.only(top: 8),
        width: 88,
        child: GestureDetector(
            onTap: () => onTap.call(), child: Column(children: [icon, label])));
  }
}
