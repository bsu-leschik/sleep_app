import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/ads/widgets/title.dart';

import '../../music_chooser/items/music_item_widget.dart';
import '../../music_chooser/items/sound_item_widget.dart';
import '../../storage/music_storage/music_storage.dart';
import 'buttons.dart';

class AdWidget extends StatelessWidget {
  final String type, title;
  const AdWidget({super.key, required this.type, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AdTitle(),
                const SizedBox(height: 45),
                type == 'sound'
                    ? SoundItemIcon(title: title, updating: false)
                    : MusicItemIcon(
                        title: title,
                        imageRoute: Provider.of<MusicStorage>(context)
                            .getItemByName(title)!
                            .imageRoute,
                        updating: false),
                const SizedBox(height: 15),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Watch a short video\n to open the $type',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF8E9FCC),
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 35),
                const AdButtons(),
              ]),
        ),
        const Align(
            alignment: Alignment.bottomCenter,
            child: Image(
                width: 336,
                height: 104,
                image: AssetImage('assets/images/ads/sheep.png'))),
      ],
    );
  }
}
