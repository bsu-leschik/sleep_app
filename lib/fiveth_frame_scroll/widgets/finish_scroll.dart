import 'package:flutter/material.dart';

import 'bar_widget_scroll.dart';
import 'first_lock_scroll.dart';
import 'second_lock_scroll.dart';
import 'type_music_scroll.dart';

class FinishScroll extends StatefulWidget {
  const FinishScroll({super.key});

  @override
  State<FinishScroll> createState() => _FinishScrollState();
}

class _FinishScrollState extends State<FinishScroll> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: Column(
        children: [
          const BarWidgetScroll(),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          const TypeMusicScroll(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                const FirstLockScroll(),
                Divider(
                  color: const Color(0xFF8E9FCC),
                  thickness: 1,
                  indent: screenWidth * 0.11,
                  endIndent: screenWidth * 0.11,
                ),
                const SecondLockScroll(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
