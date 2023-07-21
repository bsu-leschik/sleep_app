import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/storage/mixes/mixes_storage.dart';
import 'package:sleep_app/fiveth_frame/storage/sounds_storage/sounds_storage.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/music_types_bar/choose_music_bar_model.dart';

import '../../storage/sounds_storage/sound_item.dart';
import 'sound_property.dart';

class SoundItemWidgetState extends State<SoundItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 99,
      child: GestureDetector(
        onTap: () => Provider.of<MixesStorage>(context, listen: false)
            .addSound(SoundItem.fromWidget(widget)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SoundIcon(name: widget.title),
            Text(widget.title,
                maxLines: 1,
                style: GoogleFonts.nunito(
                  color: const Color.fromRGBO(142, 159, 204, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

class SoundIcon extends StatelessWidget {
  const SoundIcon({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 78,
        height: 78,
        decoration: BoxDecoration(
          color: Provider.of<MixesStorage>(context).player.isTitlePlaying(name)
              ? const Color.fromRGBO(151, 71, 255, 1)
              : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          border: Border.all(
            color: const Color(0xFF8E9FCC),
            width: 1,
          ),
        ),
        child: Image.asset("assets/images/Fire.png"),
      ),
      Positioned(top: 0, right: 0, child: SoundProperty(name, SoundsStorage))
    ]);
  }
}

class SoundItemWidget extends StatefulWidget {
  final String title;
  final SoundProperties property;
  final SoundType type;

  const SoundItemWidget(
      {required this.property,
      required this.title,
      required this.type,
      super.key});

  factory SoundItemWidget.fromSoundItem(SoundItem item) => SoundItemWidget(
      title: item.title, property: item.property, type: item.type);

  @override
  State<StatefulWidget> createState() => SoundItemWidgetState();
}
