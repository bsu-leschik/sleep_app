import 'package:flutter/material.dart';

import 'bar_widget_current.dart';
import 'lock_music.dart';
import 'type_music_current.dart';
import 'unlock_music.dart';

class TotalFrame extends StatefulWidget {
  const TotalFrame({super.key});

  @override
  State<TotalFrame> createState() => _TotalFrameState();
}

class _TotalFrameState extends State<TotalFrame> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const BarWidgetCurrent(),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          const TypeMusicCurrent(),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          const LockMusic(),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          SizedBox(
            height: screenHeight * 0.49,
            width: screenWidth,
            child: const UnlockMusic(),
          ),
        ],
      ),
    );
  }
}
