import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../storage/mixes/mixes_storage.dart';

class SoundSlider extends StatefulWidget {
  final String name;
  const SoundSlider({
    super.key,
    required this.name,
  });

  @override
  State<StatefulWidget> createState() => _SoundSliderState();
}

class _SoundSliderState extends State<SoundSlider> {
  double volume = 1.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        thumbColor: Color(0xff7E44FA),
        thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 5, elevation: 0, pressedElevation: 0),
        trackHeight: 8,
        trackShape: RoundedRectSliderTrackShape(),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
      ),
      child: Slider(
        activeColor: const Color(0xff7E44FA),
        inactiveColor: const Color(0xff01308C),
        divisions: 100,
        value: volume,
        min: 0,
        max: 1,
        onChanged: (double volume) {
          Provider.of<MixesStorage>(context, listen: false)
              .adjustMusicVolume(volume);
          setState(() {
            this.volume = volume;
          });
        },
      ),
    );
  }
}
