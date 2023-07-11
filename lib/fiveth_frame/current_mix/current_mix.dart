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
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 51, left: 17, right: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const MixTopBar()),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const TypeMusicCurrent()),
              //LockMusic(),
              //UnlockMusic(),
            ],
          ),
        ),
      ),
    );
  }
}
