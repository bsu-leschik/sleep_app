import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../music_chooser/items/sound_property.dart';
import '../../../storage/music_storage/music_storage.dart';

class MixMusicIcon extends StatelessWidget {
  final String name;
  const MixMusicIcon({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      width: 78,
      child: Stack(children: [
        Container(
          height: 78,
          width: 78,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff8E9FCC),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Image(
            image: AssetImage(Provider.of<MusicStorage>(context)
                .getItemByName(name)!
                .imageRoute),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SoundProperty(name, MusicStorage),
        ),
      ]),
    );
  }
}
