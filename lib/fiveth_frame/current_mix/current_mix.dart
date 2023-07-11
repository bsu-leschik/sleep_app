import 'package:flutter/material.dart';

import 'widgets/bar_widget_current.dart';
import 'widgets/lock_music.dart';
import 'widgets/type_music_current.dart';
import 'widgets/unlock_music.dart';

class CurrentMix extends StatefulWidget {
  const CurrentMix({super.key});

  @override
  State<CurrentMix> createState() => _CurrentMixState();
}

class _CurrentMixState extends State<CurrentMix> {
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
