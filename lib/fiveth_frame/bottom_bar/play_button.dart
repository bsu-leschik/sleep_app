import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../music_chooser/items/play_controller.dart';

class MainPlayButton extends StatelessWidget {
  const MainPlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      width: 94,
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
          size: 65,
          Provider.of<PlayController>(context).isPlaying
              ? Icons.pause_rounded
              : Icons.play_arrow_rounded,
          color: const Color(0xFF7E44FA),
        ),
      ),
    );
  }
}
