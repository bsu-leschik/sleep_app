import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/widget/example_my.dart';

import 'widget/bar_widget.dart';
import 'widget/type_music.dart';
import 'widget/first_lock.dart';
import 'widget/second_lock.dart';

class FivethFrame extends StatefulWidget {
  const FivethFrame({super.key});

  @override
  State<FivethFrame> createState() => _FivethFrameState();
}

class _FivethFrameState extends State<FivethFrame> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: Column(
        children: [
          const BarWidget(),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          const TypeMusic(),
          SizedBox(height: screenHeight * 0.01),
          const FirstLock(),
          Divider(
            color: const Color(0xFF8E9FCC),
            thickness: 1,
            indent: screenWidth * 0.11,
            endIndent: screenWidth * 0.11,
          ),
          const MainHome(),
        ],
      ),
    );
  }
}
