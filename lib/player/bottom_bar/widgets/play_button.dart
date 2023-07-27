import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';

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
          if (Provider.of<MixesStorage>(context, listen: false)
              .player
              .isPlaying) {
            Provider.of<MixesStorage>(context, listen: false).pause();
          } else {
            Provider.of<MixesStorage>(context, listen: false).resume();
          }
        },
        child: Icon(
          size: 65,
          Provider.of<MixesStorage>(context).player.isPlaying
              ? Icons.pause_rounded
              : Icons.play_arrow_rounded,
          color: const Color(0xFF7E44FA),
        ),
      ),
    );
  }
}
