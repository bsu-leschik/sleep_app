import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sleep_app/fiveth_frame/bottom_bar/play_button.dart';

import 'bottom_nav_button.dart';

class BottomNavBar extends StatefulWidget {
  final Widget? currentWidget;
  const BottomNavBar({required this.currentWidget, super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.currentWidget ?? const Text("You are not meant to be here"),
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
                    onTap: () {
                      if (GoRouter.of(context).location == "/current-mix") {
                        context.pop();
                      } else {
                        context.push('/current-mix');
                      }
                    },
                  )
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
                      onTap: () {
                        if (GoRouter.of(context).location == "/timer") {
                          context.pop();
                        } else {
                          context.push("/timer");
                        }
                      }),
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
